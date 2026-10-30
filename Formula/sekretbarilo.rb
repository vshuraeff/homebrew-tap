class Sekretbarilo < Formula
  desc "High-performance secret scanner for git workflows and AI coding agents"
  homepage "https://github.com/vshuraeff/sekretbarilo"
  version "0.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.12.0/sekretbarilo-v0.12.0-aarch64-apple-darwin.tar.gz"
      sha256 "61d1fcb89506096f8f33611597b6c78ba70113879e4f81f7e759718d03ed7a5d"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.12.0/sekretbarilo-v0.12.0-x86_64-apple-darwin.tar.gz"
      sha256 "df8e3f95b0cc8cb296f065716f22cb98938dba55e8d1685583124c3f19806755"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.12.0/sekretbarilo-v0.12.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cdd0de28abb080383824dd892cc9a3486326eb05d3b35105e7232d2a13c078eb"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.12.0/sekretbarilo-v0.12.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9b23e421789b9b5fbe2343eec1b05213ccbe57250f8aabd5c765485161d5b2b7"
    end
  end

  def install
    bin.install "sekretbarilo"
  end

  test do
    assert_match "sekretbarilo #{version}", shell_output("#{bin}/sekretbarilo --version 2>&1")
  end
end
