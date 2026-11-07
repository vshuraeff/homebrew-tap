class Sekretbarilo < Formula
  desc "High-performance secret scanner for git workflows and AI coding agents"
  homepage "https://github.com/vshuraeff/sekretbarilo"
  version "0.13.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.13.2/sekretbarilo-v0.13.2-aarch64-apple-darwin.tar.gz"
      sha256 "df3922381c82638070c7b61dc739528ff0dbfbdde8d915726a186e7859a7cb13"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.13.2/sekretbarilo-v0.13.2-x86_64-apple-darwin.tar.gz"
      sha256 "970ffc1bd5c8d0c4732dd78032b876f4856dc45375f73d856564d6a87182e8de"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.13.2/sekretbarilo-v0.13.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5705cdd9ff479c7b812239302e6c7b8aa97138095313a109f2d379c083496828"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.13.2/sekretbarilo-v0.13.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "64e6311a308cbb450d62dfc822ab4e10c9b1984161a33c1180112353cbb6bb66"
    end
  end

  def install
    bin.install "sekretbarilo"
  end

  test do
    assert_match "sekretbarilo #{version}", shell_output("#{bin}/sekretbarilo --version 2>&1")
  end
end
