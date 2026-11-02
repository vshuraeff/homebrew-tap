class Sekretbarilo < Formula
  desc "High-performance secret scanner for git workflows and AI coding agents"
  homepage "https://github.com/vshuraeff/sekretbarilo"
  version "0.13.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.13.0/sekretbarilo-v0.13.0-aarch64-apple-darwin.tar.gz"
      sha256 "a7834f46c8980b261d3528527049b63ee08b983c9c08e371e802646634e09901"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.13.0/sekretbarilo-v0.13.0-x86_64-apple-darwin.tar.gz"
      sha256 "c89b3274a32aebbe4c550f7174bcf52d6c21af2cf258c0991cd8410490b30d71"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.13.0/sekretbarilo-v0.13.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "09b4edc860a07e7c882b56f5ec5e17cefb81d582d7901f22aebc29bd8d480435"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.13.0/sekretbarilo-v0.13.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "efce26f92ab66652dff93e988ad4049780b287e4776099f1738f9eb59273336a"
    end
  end

  def install
    bin.install "sekretbarilo"
  end

  test do
    assert_match "sekretbarilo #{version}", shell_output("#{bin}/sekretbarilo --version 2>&1")
  end
end
