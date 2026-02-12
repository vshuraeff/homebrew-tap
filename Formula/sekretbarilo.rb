class Sekretbarilo < Formula
  desc "High-performance secret scanner for git workflows and AI coding agents"
  homepage "https://github.com/vshuraeff/sekretbarilo"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.2.2/sekretbarilo-v0.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "0765d8728c1cf6cc30400ca331034c761eea607d4c694f76b50afe69a16df84f"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.2.2/sekretbarilo-v0.2.2-x86_64-apple-darwin.tar.gz"
      sha256 "a49f8becbe489d3e003285803b6ce85182312454a2de86469833bf2871cfba91"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.2.2/sekretbarilo-v0.2.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "55d7582a92c1e411f04989b8de609c699882c8dac24b226b8365e1290683a362"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.2.2/sekretbarilo-v0.2.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6bfac04530adfa47690f053ec3f7c276179ad56dc49acc4b9233f8291cefe512"
    end
  end

  def install
    bin.install "sekretbarilo"
  end

  test do
    assert_match "sekretbarilo #{version}", shell_output("#{bin}/sekretbarilo --version 2>&1")
  end
end
