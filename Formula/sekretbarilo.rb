class Sekretbarilo < Formula
  desc "High-performance secret scanner for git workflows and AI coding agents"
  homepage "https://github.com/vshuraeff/sekretbarilo"
  version "0.13.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.13.1/sekretbarilo-v0.13.1-aarch64-apple-darwin.tar.gz"
      sha256 "1c3da259a77308654c270a8696bfea22fc57ea3516829b72cb5f1e11ab6c5b8d"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.13.1/sekretbarilo-v0.13.1-x86_64-apple-darwin.tar.gz"
      sha256 "a93dc1b1eff37304318f305df39865a712fed13a36d10cd7a6280efd97efc981"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.13.1/sekretbarilo-v0.13.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bdbcc515c23c59c032af25d9f147a9a5929c5e55889774aec77159e314ed88cd"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.13.1/sekretbarilo-v0.13.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "70114cd2f2985cab27bd918f22ab99f7f052a3d28d0eac9c73ae004a9a664a7c"
    end
  end

  def install
    bin.install "sekretbarilo"
  end

  test do
    assert_match "sekretbarilo #{version}", shell_output("#{bin}/sekretbarilo --version 2>&1")
  end
end
