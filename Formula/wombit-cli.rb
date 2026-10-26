# Written by scripts/release/release.sh publish (D169); edit the template, not the tap.
class WombitCli < Formula
  desc "Explains what is using a Mac's disk; cleans up only when asked (open source)"
  homepage "https://wombit.app/docs/command-line-tool"
  url "https://github.com/rohit-saluja/wombit-releases/releases/download/v1.1/wombit-cli-0.4.1.zip"
  version "0.4.1"
  sha256 "feb35d27993103d3053188818092fec44401dfddf91487d7cc2f03d31a43f5c7"
  license "Apache-2.0"

  depends_on macos: :tahoe

  def install
    # The binary finds the rules catalog beside it, so both live in libexec.
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"wombit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wombit --version")
    system bin/"wombit", "space"
  end
end
