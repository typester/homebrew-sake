# homebrew-sake

Homebrew tap for [sake](https://github.com/typester/sake), an open source macOS app for
running Windows games on Apple silicon.

## Installation

```sh
brew tap typester/sake
brew install --cask sake
```

Apple silicon and macOS 15 or newer. The cask refuses to install anywhere else, because
sake cannot run anywhere else.

## Gatekeeper

Sake.app is ad-hoc signed, not notarised. On first launch macOS will stop it.

**Option 1:** allow it in **System Settings** > **Privacy & Security**.

**Option 2:** install without quarantine:

```sh
brew install --cask --no-quarantine sake
```

## What gets installed

- `Sake.app` in `/Applications`

That is all. sake has no command line tool. On first run the app builds its own Wine engine,
which needs the Xcode Command Line Tools, Apple's Game Porting Toolkit dmg — a free Apple ID
is enough — and about 10 GB of disk.

## Uninstall

```sh
brew uninstall --cask sake
brew untap typester/sake
```

That leaves the engine, the bottles and the games where they are. To take those too:

```sh
brew uninstall --zap --cask sake
```

**`--zap` moves `~/Library/Sake` to the Trash**, which is the engine, every bottle and every
game inside them — it can be hundreds of gigabytes. It also takes `~/Library/Caches/Sake`
and the app's preferences. sake's own **Uninstall** in the app menu does the same thing and
also goes to the Trash, so either way it can be put back.
