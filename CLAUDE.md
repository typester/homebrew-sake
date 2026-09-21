# homebrew-sake

Homebrew tap for sake. One cask, one workflow; sake's own repository holds everything else.

## Structure

```
homebrew-sake/
├── Casks/sake.rb                      the cask
├── .github/workflows/update-cask.yml  receives a dispatch from sake and bumps the cask
├── README.md                          user documentation
└── CLAUDE.md                          this file
```

## Nothing here decides anything

sake's `release.yml` builds the app, hashes the zip, and sends a `repository_dispatch` of
type `update-cask`. The workflow here rewrites the cask's `version` and `sha256`, checks
that the url resolves, and commits as `sake {VERSION}`. If it ever has to be redone by
hand, the same workflow takes a `workflow_dispatch` with the same two inputs.

Everything that decides something — the version, the tag, the name of the zip, how a
release is cut at all — lives in `typester/sake`, and `docs/releasing.md` there is the file
to read. **This repository goes long stretches untouched, so do not write anything here
that the other one could go and change.**

## Testing

```sh
brew tap typester/sake
brew info --cask sake
brew audit --cask --no-online typester/sake/sake
```

## Code style

English, and comments only where something would otherwise be rediscovered the hard way.
