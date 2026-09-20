class Sekretbarilo < Formula
  desc "High-performance secret scanner for git workflows and AI coding agents"
  homepage "https://github.com/vshuraeff/sekretbarilo"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.8.0/sekretbarilo-v0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "37ff69d881fc5617b0de5c48af92d54aa0e598ba143e6f8571905eee01b1d9ef"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.8.0/sekretbarilo-v0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "37265c754c84db13f06d83a53293c508cbc40ff5c4485096df4d893328dbddc8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.8.0/sekretbarilo-v0.8.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e5736151f32486fec35e82198a14e61c2bb1bb14a5e5a3e69f7e2b8c4f1b6e78"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.8.0/sekretbarilo-v0.8.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "23d39146f3ed144a7b8fa58e1d34f1533592f86475f80c4ec8a1bc8f7cd43356"
    end
  end

  def install
    bin.install "sekretbarilo"
  end

  test do
    assert_match "sekretbarilo #{version}", shell_output("#{bin}/sekretbarilo --version 2>&1")
  end
end
