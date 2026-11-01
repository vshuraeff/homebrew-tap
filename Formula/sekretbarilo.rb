class Sekretbarilo < Formula
  desc "High-performance secret scanner for git workflows and AI coding agents"
  homepage "https://github.com/vshuraeff/sekretbarilo"
  version "0.12.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.12.2/sekretbarilo-v0.12.2-aarch64-apple-darwin.tar.gz"
      sha256 "44eacbc26092e71fc41c50de452f799ee7fa70310c49da17e134cb0c1c8045d5"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.12.2/sekretbarilo-v0.12.2-x86_64-apple-darwin.tar.gz"
      sha256 "1fccf1f6e286126e1f724cfd3caceed95e46280c6cbc5a2bc315b4762c21addd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.12.2/sekretbarilo-v0.12.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "49369abb04c4534b753d2592bd31aa8e5821bdea3aae5205723d4afd297a666b"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.12.2/sekretbarilo-v0.12.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5a4fd00401673ad332edea0f687c5d0b7166116e52c5af8cec8ea4354cc65955"
    end
  end

  def install
    bin.install "sekretbarilo"
  end

  test do
    assert_match "sekretbarilo #{version}", shell_output("#{bin}/sekretbarilo --version 2>&1")
  end
end
