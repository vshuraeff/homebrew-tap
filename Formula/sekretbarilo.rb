class Sekretbarilo < Formula
  desc "High-performance secret scanner for git workflows and AI coding agents"
  homepage "https://github.com/vshuraeff/sekretbarilo"
  version "0.5.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.5.3/sekretbarilo-v0.5.3-aarch64-apple-darwin.tar.gz"
      sha256 "80037b35b2acd3a0fffdb872f2d0d519a64a4e463352bf9529ee839c1c2a7849"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.5.3/sekretbarilo-v0.5.3-x86_64-apple-darwin.tar.gz"
      sha256 "bf7a7ed930bc509438bbefd3f5ed5f6939001e857627e437b3b7227985fbdc21"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.5.3/sekretbarilo-v0.5.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fd0d107db061f793d017bba86b6fac928b1ba5d2b266c684e5dcbef199fdfe44"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.5.3/sekretbarilo-v0.5.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0079c30f3f1d4b4b52a6f9d566436cd5f17c150bea7f8ec612e752ea614c410d"
    end
  end

  def install
    bin.install "sekretbarilo"
  end

  test do
    assert_match "sekretbarilo #{version}", shell_output("#{bin}/sekretbarilo --version 2>&1")
  end
end
