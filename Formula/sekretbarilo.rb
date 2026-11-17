class Sekretbarilo < Formula
  desc "High-performance secret scanner for git workflows and AI coding agents"
  homepage "https://github.com/vshuraeff/sekretbarilo"
  version "0.14.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.14.0/sekretbarilo-v0.14.0-aarch64-apple-darwin.tar.gz"
      sha256 "7ba52e3d2b07daf3f135ce9f48bba9d0634e59cd9d4288205c62cef2f99977f3"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.14.0/sekretbarilo-v0.14.0-x86_64-apple-darwin.tar.gz"
      sha256 "5ac7577f57fa151b61814417cfcc4a2b43cf12e96305ad5f7f9e9801bed48a75"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.14.0/sekretbarilo-v0.14.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7f7f2d02eff5fd4573a10308ee2c7fe8dec8143ba1c40acdb238bde8e86acdc8"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.14.0/sekretbarilo-v0.14.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "30408e734d60eea1d00da829efe9974c02183a12cfc981d96d6e5a5a0341b7ae"
    end
  end

  def install
    bin.install "sekretbarilo"
  end

  test do
    assert_match "sekretbarilo #{version}", shell_output("#{bin}/sekretbarilo --version 2>&1")
  end
end
