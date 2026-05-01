class Codexbar < Formula
  desc "macOS menu bar app that tracks AI coding service usage limits"
  homepage "https://github.com/vshuraeff/CodexBar"
  url "https://github.com/vshuraeff/CodexBar.git",
      revision: "3ce6e2ac96b8f4abdddbfbf35acba317fc4f8780"
  version "0.24"
  license "MIT"
  head "https://github.com/vshuraeff/CodexBar.git", branch: "main"

  depends_on xcode: ["16.0", :build]
  depends_on macos: :sonoma

  def install
    # Determine host architecture for single-arch build
    host_arch = Hardware::CPU.arm? ? "arm64" : "x86_64"

    # Workaround: SwiftPM calls /usr/bin/sandbox-exec by absolute path for
    # manifest compilation, which fails on macOS 15+ with "Operation not permitted".
    # Patch package_app.sh so its internal swift build calls also skip the sandbox.
    inreplace "Scripts/package_app.sh",
              "swift build -c",
              "swift build --disable-sandbox -c"
    # Homebrew's sandbox blocks the xcodebuild pass used only for WidgetKit
    # App Intents metadata. The app and CLI are usable without the widget.
    inreplace "Scripts/package_app.sh",
              'if [[ -n "$(resolve_binary_path "CodexBarWidget" "${ARCH_LIST[0]}")" ]]; then',
              'if false && [[ -n "$(resolve_binary_path "CodexBarWidget" "${ARCH_LIST[0]}")" ]]; then'

    # Build all Swift targets for the host architecture
    system "swift", "build",
           "-c", "release",
           "--disable-sandbox",
           "--arch", host_arch

    # Package the .app bundle with ad-hoc signing (no Apple Developer account needed)
    ENV["CODEXBAR_SIGNING"] = "adhoc"
    ENV["ARCHES"] = host_arch
    system "./Scripts/package_app.sh", "release"

    # Avoid Homebrew's post-install rpath fixer resolving Formula["codexbar"],
    # which is ambiguous when both steipete/tap and vshuraeff/tap are tapped.
    sparkle_framework = buildpath/"CodexBar.app/Contents/Frameworks/Sparkle.framework"
    sparkle_library = sparkle_framework/"Versions/B/Sparkle"
    if sparkle_library.exist?
      MachO::Tools.change_dylib_id(
        sparkle_library,
        "#{opt_prefix}/CodexBar.app/Contents/Frameworks/Sparkle.framework/Versions/B/Sparkle",
      )
      system "codesign", "--force", "--sign", "-", sparkle_library
      system "codesign", "--force", "--sign", "-", sparkle_framework
      system "codesign",
             "--force",
             "--sign",
             "-",
             "--entitlements",
             buildpath/".build/entitlements/CodexBar.entitlements",
             "CodexBar.app"
    end

    # Install CodexBar.app into the Cellar prefix
    prefix.install "CodexBar.app"

    # Symlink the CLI binary
    cli_path = prefix/"CodexBar.app/Contents/Helpers/CodexBarCLI"
    bin.install_symlink cli_path => "codexbar" if cli_path.exist?
  end

  def caveats
    <<~EOS
      Link CodexBar to /Applications (auto-updates on brew upgrade):
        ln -sf "#{opt_prefix}/CodexBar.app" /Applications/

      The app is ad-hoc signed. On first launch macOS may block it.
      Go to System Settings > Privacy & Security and click "Open Anyway".

      Sparkle auto-updates are disabled in this build.
      Update via: brew upgrade vshuraeff/tap/codexbar
    EOS
  end

  test do
    assert_match "codexbar", shell_output("#{bin}/codexbar --help 2>&1")
  end
end
