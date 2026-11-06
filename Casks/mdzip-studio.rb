cask "mdzip-studio" do
  # The release workflow in mdzip-project/mdzip-studio (bump-tap.yml) rewrites
  # `version` and `sha256` on every published release. The all-zero sha256 below
  # is a placeholder until the first automated bump; do not install from it.
  version "1.6.1"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/mdzip-project/mdzip-studio/releases/download/v#{version}/MDZip-Studio-#{version}-universal.dmg"
  name "MDZip Studio"
  desc "Editor and viewer for MDZip (.mdz) documents and Markdown"
  homepage "https://mdzip.org"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :monterey"

  app "MDZip Studio.app"

  zap trash: [
    "~/Library/Application Support/MDZip Studio",
    "~/Library/Caches/org.mdzip.studio",
    "~/Library/Caches/org.mdzip.studio.ShipIt",
    "~/Library/Preferences/org.mdzip.studio.plist",
    "~/Library/Saved Application State/org.mdzip.studio.savedState",
  ]

  caveats <<~EOS
    MDZip Studio is ad-hoc signed but not notarized by Apple, so macOS blocks
    the first launch. This is expected. To open it:

      1. Open MDZip Studio from Applications. When macOS says it could not
         verify the app, click Done.
      2. Open System Settings > Privacy & Security and scroll down to the
         message about "MDZip Studio" being blocked.
      3. Click Open Anyway, then confirm with Touch ID or your password.

    You only do this once per version. After
    `brew upgrade --cask mdzip-studio`, macOS may ask again for the new one.
  EOS
end
