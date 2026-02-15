class Sekretbarilo < Formula
  desc "High-performance secret scanner for git workflows and AI coding agents"
  homepage "https://github.com/vshuraeff/sekretbarilo"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.4.0/sekretbarilo-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "810990a253839a657a0acf3e39c989864be38a319bfbb6c135e5e068fde559f9"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.4.0/sekretbarilo-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "6cc1a55b5cd6f38d5e7f29271c7960d1f298abada4f25fa421489c1467195c6e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.4.0/sekretbarilo-v0.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "812e0535e489c63e56996da7c1e41e2240e9e046642b317b598ee471b4008d83"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.4.0/sekretbarilo-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1b3f728105b78c98b8ac95eedae542336f23b90ccec5970c16f84f5356ca16ec"
    end
  end

  def install
    bin.install "sekretbarilo"
  end

  test do
    assert_match "sekretbarilo #{version}", shell_output("#{bin}/sekretbarilo --version 2>&1")
  end
end
