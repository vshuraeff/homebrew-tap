class Sekretbarilo < Formula
  desc "High-performance secret scanner for git workflows and AI coding agents"
  homepage "https://github.com/vshuraeff/sekretbarilo"
  version "0.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.11.0/sekretbarilo-v0.11.0-aarch64-apple-darwin.tar.gz"
      sha256 "536c8a6b927a7e9b0810d943da0658bc56e92d5530a31cca547096129ac2ddf1"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.11.0/sekretbarilo-v0.11.0-x86_64-apple-darwin.tar.gz"
      sha256 "4f8743f175f883677e5295a8b40e9a723246d8752d89fd0bf6790df231ae1ea6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.11.0/sekretbarilo-v0.11.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3b027168bcf58425a303e42ae17e9ae51a2368044cc1c6b96692daf49e04077b"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.11.0/sekretbarilo-v0.11.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d4efd2bccb7bea7db9eb27883eaed732faf00e4299fea6589658eb530574df17"
    end
  end

  def install
    bin.install "sekretbarilo"
  end

  test do
    assert_match "sekretbarilo #{version}", shell_output("#{bin}/sekretbarilo --version 2>&1")
  end
end
