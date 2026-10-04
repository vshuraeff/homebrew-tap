class Sekretbarilo < Formula
  desc "High-performance secret scanner for git workflows and AI coding agents"
  homepage "https://github.com/vshuraeff/sekretbarilo"
  version "0.9.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.9.1/sekretbarilo-v0.9.1-aarch64-apple-darwin.tar.gz"
      sha256 "3d0eb70008b219fb9b694feb1ccdc46f025950f71a779b7f66440ada2c98a3c0"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.9.1/sekretbarilo-v0.9.1-x86_64-apple-darwin.tar.gz"
      sha256 "e38bc060f18ab534eda0b231a123206faaa1b9cc7f923832e741770b5eb8263d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.9.1/sekretbarilo-v0.9.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3acac9b0c3efb2359bfeb5122b78fbca9d1bf8f03d8193c1654048018bb9b25c"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.9.1/sekretbarilo-v0.9.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "36409b09284cb1b1c43fb6f17413231b00a16fcaffd1d667190b5d66c4c9ed71"
    end
  end

  def install
    bin.install "sekretbarilo"
  end

  test do
    assert_match "sekretbarilo #{version}", shell_output("#{bin}/sekretbarilo --version 2>&1")
  end
end
