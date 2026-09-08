class Sekretbarilo < Formula
  desc "High-performance secret scanner for git workflows and AI coding agents"
  homepage "https://github.com/vshuraeff/sekretbarilo"
  version "0.6.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.6.2/sekretbarilo-v0.6.2-aarch64-apple-darwin.tar.gz"
      sha256 "8827a8c1e322fae557ea5b8fcbbc881c84cffcfb36be782d77f5ae664c77c648"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.6.2/sekretbarilo-v0.6.2-x86_64-apple-darwin.tar.gz"
      sha256 "d1e82d1d707f01b0925f93d0ca8a270a2ca0f3f2bafdac1b5725028509076351"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.6.2/sekretbarilo-v0.6.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4397ded1bc42aa705a5374108162cf6a7ead74bd25c9844345e041f1be077aa1"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.6.2/sekretbarilo-v0.6.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0efe23bd2f6baf8093f1be90c166ed0f44ccee12084b2b6bd50f418e89015a52"
    end
  end

  def install
    bin.install "sekretbarilo"
  end

  test do
    assert_match "sekretbarilo #{version}", shell_output("#{bin}/sekretbarilo --version 2>&1")
  end
end
