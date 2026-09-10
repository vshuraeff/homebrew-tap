class Sekretbarilo < Formula
  desc "High-performance secret scanner for git workflows and AI coding agents"
  homepage "https://github.com/vshuraeff/sekretbarilo"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.7.0/sekretbarilo-v0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "bdbde51e5575b33b08e89c77dbc8320e0c1d9f102ee56a180a154f873b9cb175"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.7.0/sekretbarilo-v0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "7ff2357f29b0661c8e068369c60b6b9fba8b24e5254fe4dcc5a1f93a565cba6f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.7.0/sekretbarilo-v0.7.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b5a80637adb93f6878020ff18841f82ed6d069cff956265d985a97ca59cbc8a7"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.7.0/sekretbarilo-v0.7.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "03a102f4aaa4af1f02ddf0cf9539a05f46d14bde538075171f4595487236f678"
    end
  end

  def install
    bin.install "sekretbarilo"
  end

  test do
    assert_match "sekretbarilo #{version}", shell_output("#{bin}/sekretbarilo --version 2>&1")
  end
end
