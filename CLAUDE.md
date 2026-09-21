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

## How the cask gets updated

Not by hand, normally. sake's `release.yml` builds the app, hashes the zip, and sends a
`repository_dispatch` of type `update-cask` carrying `version` and `arm64_sha256`. The
workflow here rewrites those two fields, checks that the url resolves, and commits as
`sake {VERSION}`.

By hand, if that ever has to be redone: the same workflow takes `workflow_dispatch` with
the same two inputs.

## The url it builds

- Tag: `v{VERSION}` — release-please makes it in sake's repository, nobody tags by hand
- Asset: `https://github.com/typester/sake/releases/download/v{VERSION}/Sake-arm64-{VERSION}.zip`
- arm64 only. sake needs Apple silicon, so there is no second architecture to carry.

## Version numbers live in sake

`VERSION` in sake's repository is the source, and release-please owns it. Nothing here
decides a version; this repository only learns about one.

## Testing

```sh
brew tap typester/sake
brew info --cask sake
brew audit --cask --no-online typester/sake/sake
```

`--online` has not been run here: `brew audit` refuses to start on a machine whose Xcode is
older than the one Homebrew wants.

## Code style

English, and comments only where something would otherwise be rediscovered the hard way.
