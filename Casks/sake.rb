cask "sake" do
  version "0.1.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/typester/sake/releases/download/v#{version}/Sake-arm64-#{version}.zip"
  name "sake"
  desc "Run Windows games on an Apple silicon Mac"
  homepage "https://github.com/typester/sake"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Sake.app"

  caveats <<~EOS
    Sake.app is not signed. On first launch, allow it in
    System Settings > Privacy & Security.

    Or install with: brew install --cask --no-quarantine sake

    sake builds its own Wine engine the first time it runs. That needs the Xcode
    Command Line Tools, Apple's Game Porting Toolkit dmg, and about 10 GB of disk.
  EOS

  zap trash: [
    "~/Library/Sake",
    "~/Library/Caches/Sake",
    "~/Library/Preferences/dev.typester.sake.plist",
    "~/Library/Saved Application State/dev.typester.sake.savedState",
  ]
end
