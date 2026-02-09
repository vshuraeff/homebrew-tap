# vshuraeff/homebrew-tap

Homebrew tap for vshuraeff packages.

## Formulae

### CodexBar (build from source)

Builds CodexBar from source on your machine. Supports both Intel (x86_64) and Apple Silicon (arm64) Macs.

#### Install

```bash
brew tap vshuraeff/tap
brew install vshuraeff/tap/codexbar
```

#### Copy to /Applications

```bash
cp -R "$(brew --prefix)/opt/codexbar/CodexBar.app" /Applications/
open /Applications/CodexBar.app
```

#### Install from latest main (HEAD)

```bash
brew install --HEAD vshuraeff/tap/codexbar
```

#### Update

```bash
brew upgrade vshuraeff/tap/codexbar
```

#### Notes

- Requires macOS 14+ (Sonoma) and Xcode 16+.
- The app is ad-hoc signed. On first launch, go to System Settings > Privacy & Security and click "Open Anyway".
- Sparkle auto-updates are disabled; update via `brew upgrade`.
