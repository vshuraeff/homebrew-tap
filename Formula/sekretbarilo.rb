class Sekretbarilo < Formula
  desc "High-performance secret scanner for git workflows and AI coding agents"
  homepage "https://github.com/vshuraeff/sekretbarilo"
  version "0.6.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.6.3/sekretbarilo-v0.6.3-aarch64-apple-darwin.tar.gz"
      sha256 "1189aff644f99940ca4f80b6ff1358725701b9b955c7116cd237629fe6586c38"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.6.3/sekretbarilo-v0.6.3-x86_64-apple-darwin.tar.gz"
      sha256 "a428b284cff44044d77e4ddabed5b717c480a7e204715cddcd4d0ca6eb5b4517"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.6.3/sekretbarilo-v0.6.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d654d89dc4ed93a9bd0c415c5c5decc186ecf48c1aa20ca7b0839512620e56b4"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.6.3/sekretbarilo-v0.6.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3049ccdfbbada791bba79f513dbd028b2634edd097e0235ac4aaf38cb2112b1f"
    end
  end

  def install
    bin.install "sekretbarilo"
  end

  test do
    assert_match "sekretbarilo #{version}", shell_output("#{bin}/sekretbarilo --version 2>&1")
  end
end
