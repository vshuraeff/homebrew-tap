class Sekretbarilo < Formula
  desc "High-performance secret scanner for git workflows and AI coding agents"
  homepage "https://github.com/vshuraeff/sekretbarilo"
  version "0.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.6.1/sekretbarilo-v0.6.1-aarch64-apple-darwin.tar.gz"
      sha256 "678b30a25371aa21a1a21475fa719a7a04fb43decf0931f90e2f47e7e6fff5e1"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.6.1/sekretbarilo-v0.6.1-x86_64-apple-darwin.tar.gz"
      sha256 "bf6494d22ba024f36370cc3034efd28fee1f3326a7448e8a29367216dd4fd112"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.6.1/sekretbarilo-v0.6.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1aea96df5fcadcfbb811a774fa41c8ddde1d2ef6978c4afbd1d38e0e219a113b"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.6.1/sekretbarilo-v0.6.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fd4fc91ad2489d71ba710fbf92fa9b75114fc36c139643d35f5f48e9535c58a3"
    end
  end

  def install
    bin.install "sekretbarilo"
  end

  test do
    assert_match "sekretbarilo #{version}", shell_output("#{bin}/sekretbarilo --version 2>&1")
  end
end
