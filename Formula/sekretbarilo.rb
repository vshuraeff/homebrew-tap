class Sekretbarilo < Formula
  desc "High-performance secret scanner for git workflows and AI coding agents"
  homepage "https://github.com/vshuraeff/sekretbarilo"
  version "0.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.11.0/sekretbarilo-v0.11.0-aarch64-apple-darwin.tar.gz"
      sha256 "98261afa583cb1533f0ffc6d5c6da690d0ca5d35b1833deb9c77c4ccd85d3a56"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.11.0/sekretbarilo-v0.11.0-x86_64-apple-darwin.tar.gz"
      sha256 "de7fb08fe14c94ef7c2bfcd39772e7932e46e49f4db511e7d358266b7aca1d19"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.11.0/sekretbarilo-v0.11.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cf52afdf210174bc9e94ce6836238b9e8a1378df7627101c6afe8a219bb1b00f"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.11.0/sekretbarilo-v0.11.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c877002e39a11528007d656c349fd965f068a60f03dbc5915503d623dbedfea5"
    end
  end

  def install
    bin.install "sekretbarilo"
  end

  test do
    assert_match "sekretbarilo #{version}", shell_output("#{bin}/sekretbarilo --version 2>&1")
  end
end
