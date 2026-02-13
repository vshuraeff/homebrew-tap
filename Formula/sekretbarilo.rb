class Sekretbarilo < Formula
  desc "High-performance secret scanner for git workflows and AI coding agents"
  homepage "https://github.com/vshuraeff/sekretbarilo"
  version "0.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.2.3/sekretbarilo-v0.2.3-aarch64-apple-darwin.tar.gz"
      sha256 "d985783c7d47d2246d084ad91618402e06148bfb8fc2f650e31ba3696cf4eb13"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.2.3/sekretbarilo-v0.2.3-x86_64-apple-darwin.tar.gz"
      sha256 "3e30d55aab581f6aff7fb94b0c79943df2a10442812768b2403ef594854c56b0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.2.3/sekretbarilo-v0.2.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9e9bec979ee099ca39fb8870c2d82adea596d4ce3aba3d76ee38774a3e8ba995"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.2.3/sekretbarilo-v0.2.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3561d384a438e59f29f1fca87d31e5b481eba309924a1c734a941734b9342090"
    end
  end

  def install
    bin.install "sekretbarilo"
  end

  test do
    assert_match "sekretbarilo #{version}", shell_output("#{bin}/sekretbarilo --version 2>&1")
  end
end
