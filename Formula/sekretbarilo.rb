class Sekretbarilo < Formula
  desc "High-performance secret scanner for git workflows and AI coding agents"
  homepage "https://github.com/vshuraeff/sekretbarilo"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.3.0/sekretbarilo-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "7a7fc10299fa765984f6f44e44b861d99962b4780ea43ddaa748a921112eed1f"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.3.0/sekretbarilo-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "30e23227d8b2961258888108ff9b86a046c667be37c6e2926d56bc5c1008dd4e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.3.0/sekretbarilo-v0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "14e4b92ebc7934ec199bad55d62ccab8dfc96dfcde2ff64a43623121f01e5b93"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.3.0/sekretbarilo-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0bead75a9320caefdd9be39795bcc0934fb884ae23b124a04be6ba9ef561910a"
    end
  end

  def install
    bin.install "sekretbarilo"
  end

  test do
    assert_match "sekretbarilo #{version}", shell_output("#{bin}/sekretbarilo --version 2>&1")
  end
end
