class Sekretbarilo < Formula
  desc "High-performance secret scanner for git workflows and AI coding agents"
  homepage "https://github.com/vshuraeff/sekretbarilo"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.6.0/sekretbarilo-v0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "0e68e82a3745e357d2780e45c0b8c233683e1ab10a59e8cd50643115e2c63dd9"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.6.0/sekretbarilo-v0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "5235b7af0a71d3c7f2d99e54aa1e2ff06ce16b01188d6516a575e812f8638529"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.6.0/sekretbarilo-v0.6.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e296da707bf057be9f298bd2be699e4a8b3aa1c00d5f8af4795e16c8d22bf61e"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.6.0/sekretbarilo-v0.6.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c2ba89f1e2613eef3ed99c7da06ff8407f7859c616a36c8224dd0e5f43c34553"
    end
  end

  def install
    bin.install "sekretbarilo"
  end

  test do
    assert_match "sekretbarilo #{version}", shell_output("#{bin}/sekretbarilo --version 2>&1")
  end
end
