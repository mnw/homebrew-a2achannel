cask "a2achannel" do
  version "0.10.0"
  sha256 "b7daa7ee0bbdb99bd810829833d9355dfa0cdf6a4e9c94a08d47a51975d90ad7"

  url "https://github.com/mnw/A2AChannel/releases/download/v#{version}/A2AChannel-#{version}.zip"
  name "A2AChannel"
  desc "Typed handoffs between Claude Code agents with a desktop coordination room"
  homepage "https://github.com/mnw/A2AChannel"

  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

  app "A2AChannel.app"

  zap trash: [
    "~/Library/Application Support/A2AChannel",
    "~/Library/Saved Application State/com.a2achannel.app.savedState",
  ]

  caveats <<~EOS
    A2AChannel is ad-hoc signed. Homebrew strips the quarantine attribute
    automatically, so the first launch should work without a Gatekeeper
    prompt. If you ever see an "unidentified developer" dialog, run:

      xattr -dr com.apple.quarantine /Applications/A2AChannel.app
  EOS
end
