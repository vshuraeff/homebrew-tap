class Sekretbarilo < Formula
  desc "High-performance secret scanner for git workflows and AI coding agents"
  homepage "https://github.com/vshuraeff/sekretbarilo"
  version "0.14.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.14.1/sekretbarilo-v0.14.1-aarch64-apple-darwin.tar.gz"
      sha256 "4ed307d701e25c199b1720bc6e7d04e336e040e0564d39dfbe19bf627474b807"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.14.1/sekretbarilo-v0.14.1-x86_64-apple-darwin.tar.gz"
      sha256 "021166caea0f90bd9cf18ce2d4809f5730471406da43a6c5fc68253f2ae964db"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.14.1/sekretbarilo-v0.14.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f71ad8ecf8319811049260fe7c7f2da39444ec784c2c93d99d7f75670f06e758"
    else
      url "https://github.com/vshuraeff/sekretbarilo/releases/download/v0.14.1/sekretbarilo-v0.14.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7750cb496c93bde26c5a9c2fa4f6c4df381c356e258b23ee0297e5cf71e6f02e"
    end
  end

  def install
    bin.install "sekretbarilo"
  end

  def caveats
    <<~EOS
      Homebrew installs only the sekretbarilo binary; it sets up no git
      or agent hooks. To install the pre-commit hook and the Claude Code
      and Codex hooks for your user, run:

        sekretbarilo install all --global --mode redact

      The Claude Code redact hook masks secrets in the output of Bash,
      Read, Grep, LSP and every MCP tool and resource. Add --no-mcp to
      limit it to Bash, Read, Grep and LSP. Check the result with:

        sekretbarilo doctor

      Docs: https://vshuraeff.github.io/sekretbarilo/agent-hooks/
    EOS
  end

  test do
    assert_match "sekretbarilo #{version}", shell_output("#{bin}/sekretbarilo --version 2>&1")
  end
end
