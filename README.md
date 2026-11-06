# homebrew-mdzip

Homebrew tap for [MDZip](https://mdzip.org) (`.mdz`), the single-file Markdown document format. It currently provides one cask, `mdzip-studio`, which installs [MDZip Studio](https://github.com/mdzip-project/mdzip-studio), the desktop editor and viewer for macOS.

## Install

```bash
brew install --cask mdzip-project/mdzip/mdzip-studio
```

Or add the tap first:

```bash
brew tap mdzip-project/mdzip
brew install --cask mdzip-studio
```

## Upgrade

```bash
brew upgrade --cask mdzip-studio
```

## First launch

MDZip Studio is ad-hoc signed but not notarized by Apple, because the project does not pay for an Apple Developer account. The cask does not remove the quarantine flag, so macOS blocks the first launch. This is expected:

1. Open MDZip Studio from Applications. When macOS says it could not verify the app, click Done.
2. Open System Settings, then Privacy & Security, and scroll down to the message about "MDZip Studio" being blocked.
3. Click Open Anyway, then confirm with Touch ID or your password.

You only do this once per install. The same steps are shown by `brew info --cask mdzip-studio`.

## How the cask is updated

The cask is updated automatically. When a new MDZip Studio release is published, a workflow in the `mdzip-studio` repository downloads the universal `.dmg`, computes its sha256 and commits the new `version` and `sha256` to `Casks/mdzip-studio.rb` here. Do not edit those two lines by hand.

## Requirements

macOS 12 (Monterey) or later, on Apple Silicon or Intel. The `.dmg` is a universal build.

## License

Apache-2.0, the same as MDZip Studio. See [LICENSE](LICENSE).
