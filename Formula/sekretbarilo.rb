class Sekretbarilo < Formula
  desc "High-performance secret scanner for git workflows and AI coding agents"
  homepage "https://github.com/vshuraeff/sekretbarilo"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.4.0/sekretbarilo-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "f1b3d9dd363080f9dece4617f043ac6b8203fb3fd126bb0cfe01cb7cc8488eee"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.4.0/sekretbarilo-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "d12b5762c806f4f47ab2ca1768bcec75a4af761b1baff09afff27d57ffe1e5ae"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.4.0/sekretbarilo-v0.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "513cdca321d6778f6ce73fb79065f17f2c28fe851132d81f9dc9eb98cb296e5f"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.4.0/sekretbarilo-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5854db2cbc086ca097b73387e405f762b71ad01868d2860d09666e916baa1bb0"
    end
  end

  def install
    bin.install "sekretbarilo"
  end

  test do
    assert_match "sekretbarilo #{version}", shell_output("#{bin}/sekretbarilo --version 2>&1")
  end
end
