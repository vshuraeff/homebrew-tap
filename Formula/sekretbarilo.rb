class Sekretbarilo < Formula
  desc "High-performance secret scanner for git workflows and AI coding agents"
  homepage "https://github.com/vshuraeff/sekretbarilo"
  version "0.12.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.12.1/sekretbarilo-v0.12.1-aarch64-apple-darwin.tar.gz"
      sha256 "b0454dea4da54168f20dea6bbc6f9fb39f3f008d7217a006e69c51c94a99d0f2"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.12.1/sekretbarilo-v0.12.1-x86_64-apple-darwin.tar.gz"
      sha256 "52b88fd532694fc8e77755ac07c43ccb13642dde1d6d54a01dfb6eeb496e5e0b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.12.1/sekretbarilo-v0.12.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4ea88a00c173a0e4918a32548e35890830e955ceeb5145142e89a370246b2d98"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.12.1/sekretbarilo-v0.12.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "44b6e550d03c5598949be55e99da9f360dab1219cf7354b7bc845cfa8a99943a"
    end
  end

  def install
    bin.install "sekretbarilo"
  end

  test do
    assert_match "sekretbarilo #{version}", shell_output("#{bin}/sekretbarilo --version 2>&1")
  end
end
