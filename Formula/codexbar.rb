class Codexbar < Formula
  desc "macOS menu bar app that tracks AI coding service usage limits"
  homepage "https://github.com/vshuraeff/CodexBar"
  url "https://github.com/vshuraeff/CodexBar.git",
      tag:      "v0.18.0-beta.3",
      revision: "c2738ec6fe91a926fd03939a47babf9b7c6dcd70"
  license "MIT"
  head "https://github.com/vshuraeff/CodexBar.git", branch: "main"

  depends_on macos: :sonoma
  depends_on xcode: ["16.0", :build]

  def install
    # Determine host architecture for single-arch build
    host_arch = Hardware::CPU.arm? ? "arm64" : "x86_64"

    # Workaround: SwiftPM calls /usr/bin/sandbox-exec by absolute path for
    # manifest compilation, which fails on macOS 15+ with "Operation not permitted".
    # Patch package_app.sh so its internal swift build calls also skip the sandbox.
    inreplace "Scripts/package_app.sh",
              "swift build -c",
              "swift build --disable-sandbox -c"

    # Build all Swift targets for the host architecture
    system "swift", "build",
           "-c", "release",
           "--disable-sandbox",
           "--arch", host_arch

    # Package the .app bundle with ad-hoc signing (no Apple Developer account needed)
    ENV["CODEXBAR_SIGNING"] = "adhoc"
    ENV["ARCHES"] = host_arch
    system "./Scripts/package_app.sh", "release"

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
    assert_match "codexbar", shell_output("#{bin}/codexbar --help 2>&1", 0)
  end
end
