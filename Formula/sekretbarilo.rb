class Sekretbarilo < Formula
  desc "High-performance secret scanner for git workflows and AI coding agents"
  homepage "https://github.com/vshuraeff/sekretbarilo"
  version "0.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.10.0/sekretbarilo-v0.10.0-aarch64-apple-darwin.tar.gz"
      sha256 "d21063f36f5483867e9e255fb8849b9cce1ba33712c15aa1ea4f267891bd6b06"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.10.0/sekretbarilo-v0.10.0-x86_64-apple-darwin.tar.gz"
      sha256 "4c58cbd980375c1f1d2e5d4f60b64e9110384f6e2e7c59959893a6f10bc10bba"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.10.0/sekretbarilo-v0.10.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f09c3a9e87941f217a5d1d5ca92c15484533548ed42dcf8b37741a8283bb95a6"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.10.0/sekretbarilo-v0.10.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b23405bc8847297d2bf03ab7365a0407fef4a3e19a86e1584dfafd30d2c15234"
    end
  end

  def install
    bin.install "sekretbarilo"
  end

  test do
    assert_match "sekretbarilo #{version}", shell_output("#{bin}/sekretbarilo --version 2>&1")
  end
end
