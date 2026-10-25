# Written by scripts/release/release.sh publish (D169); edit the template, not the tap.
cask "wombit" do
  version "1.0"
  sha256 "e96ac52e7b1203320c692a12df7ea9f5e724fde9f207e46b87701c405550ce63"

  url "https://github.com/rohit-saluja/wombit-releases/releases/download/v#{version}/Wombit-#{version}.dmg"
  name "Wombit"
  desc "Explains what is using the disk, and clears it safely"
  homepage "https://wombit.app/"

  livecheck do
    url "https://wombit.app/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: :tahoe

  app "Wombit.app"

  # The helper and the menu bar item, when the person set them up.
  uninstall launchctl: [
              "com.rohitsaluja.wombit.agent",
              "com.rohitsaluja.wombit.helper",
            ],
            quit:      [
              "com.rohitsaluja.wombit",
              "com.rohitsaluja.wombit.agent",
            ]

  zap trash: [
    "/Library/Application Support/com.rohitsaluja.wombit.helper",
    "~/Library/Application Support/com.rohitsaluja.wombit",
    "~/Library/Caches/com.rohitsaluja.wombit",
    "~/Library/HTTPStorages/com.rohitsaluja.wombit",
    "~/Library/Preferences/com.rohitsaluja.wombit.agent.plist",
    "~/Library/Preferences/com.rohitsaluja.wombit.plist",
  ]
end
