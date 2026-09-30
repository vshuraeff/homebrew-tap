class Sekretbarilo < Formula
  desc "High-performance secret scanner for git workflows and AI coding agents"
  homepage "https://github.com/vshuraeff/sekretbarilo"
  version "0.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.9.0/sekretbarilo-v0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "4e8feb3b3cc600c4636d422cc64eb56a8ef54fcd6c7e8811c5ea6b7ca4584312"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.9.0/sekretbarilo-v0.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "d99e0ab7d1e4fba6f636cbec00cff8f22001b290e3042dd04df8bbb22e9a8a1d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.9.0/sekretbarilo-v0.9.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5b1ff52f6608448461dbfcb2ca76a27e2cdc5e433f56041249b710b4bf182407"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.9.0/sekretbarilo-v0.9.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "66fecb17d2cbdac81c736a03f0e375e12fd0b04a3f3217c93d1570b6b9c56941"
    end
  end

  def install
    bin.install "sekretbarilo"
  end

  test do
    assert_match "sekretbarilo #{version}", shell_output("#{bin}/sekretbarilo --version 2>&1")
  end
end
