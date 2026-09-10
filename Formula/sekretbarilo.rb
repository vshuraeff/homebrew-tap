class Sekretbarilo < Formula
  desc "High-performance secret scanner for git workflows and AI coding agents"
  homepage "https://github.com/vshuraeff/sekretbarilo"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.7.0/sekretbarilo-v0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "9aa3e1a7745b01e16df9674589c9fb616a13a97d01c499bca58b0ca368dbb5ba"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.7.0/sekretbarilo-v0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "11bbd7a92d2b2933e69bc73e120392f986bd67ba86942216ef9d136ddb4a617a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.7.0/sekretbarilo-v0.7.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fe3c2b204d08603e51b338d48111a78f342a8bac42c0ba75f8ee1898fafd4f8a"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.7.0/sekretbarilo-v0.7.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4516ecd2acfa17270058efe51d39bc974f49f7ca228c23fa81c2e7a545525587"
    end
  end

  def install
    bin.install "sekretbarilo"
  end

  test do
    assert_match "sekretbarilo #{version}", shell_output("#{bin}/sekretbarilo --version 2>&1")
  end
end
