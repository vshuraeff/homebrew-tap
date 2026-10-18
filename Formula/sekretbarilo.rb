class Sekretbarilo < Formula
  desc "High-performance secret scanner for git workflows and AI coding agents"
  homepage "https://github.com/vshuraeff/sekretbarilo"
  version "0.11.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.11.1/sekretbarilo-v0.11.1-aarch64-apple-darwin.tar.gz"
      sha256 "22cb08a2e95a1d36c2e3afca7cd7f9b574c7310c1d8dc8e68af855bd70410d05"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.11.1/sekretbarilo-v0.11.1-x86_64-apple-darwin.tar.gz"
      sha256 "80e67b212ad2504fa521c688ece15b34f0ab68c8c6c196537a9956c8db7a577b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.11.1/sekretbarilo-v0.11.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7b3a2073ed2b4f88731ab9b5b1256c45ef52bae2a95e8137a78c9e492df3012e"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.11.1/sekretbarilo-v0.11.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9f33b4b01bbf8541c64ec3ec01188d0377af2d202f4f468f363654d2e6ced194"
    end
  end

  def install
    bin.install "sekretbarilo"
  end

  test do
    assert_match "sekretbarilo #{version}", shell_output("#{bin}/sekretbarilo --version 2>&1")
  end
end
