# Homebrew cask for the CPZAI CLI.
#
#   brew install --cask cpz-lab/tap/cpzai
#
# Binaries are hosted on our own CDN rather than GitHub releases: the CLI
# repository is private, so the anonymous GitHub API cannot resolve a version.
# The checksums below come from the same release the installer verifies
# against, so both paths agree on what a given version is.
#
# Regenerate on release with scripts/release.sh in CPZ-Lab/cpzai-cli, then
# update version and both sha256 values here.

cask "cpzai" do
  arch arm: "arm64", intel: "x64"

  version "0.1.3"
  sha256 arm:   "166703027cb91994fdb7248f6e4c00b7b13d93fefb02712583e2499bb3565f8b",
         intel: "adcce8a7d5f9a83998e5fbbf2e75ce2209297cd9237074ec15e0c0f12ddeeab3"

  url "https://cli.cpz-lab.com/releases/v#{version}/cpzai-darwin-#{arch}.tar.gz",
      verified: "cli.cpz-lab.com/"

  name "CPZAI"
  desc "Systematic trading operating system in your terminal"
  homepage "https://ai.cpz-lab.com/cli"

  depends_on macos: :monterey

  binary "cpzai"

  # Credentials live in the login keychain and settings in ~/.cpzai. Removing
  # the cask should not silently delete either, so only the config directory is
  # listed under zap, which is opt-in via `brew uninstall --zap`.
  zap trash: [
    "~/.cpzai",
    "~/Library/Caches/cpzai",
  ]

  caveats <<~EOS
    Run it:

      cpzai

    On first run it asks you to sign in and opens your browser.
  EOS
end
