class ColoredSim < Formula
  desc "Colored borders for iOS Simulators — know which agent owns which simulator"
  homepage "https://github.com/ricardorios87/colored-simulators"
  url "https://github.com/ricardorios87/colored-simulators/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "a787f97942bb388a55e0b210b4dc2c1a1459384dcb6195a5a6bd314ab0f50f9c"
  license "MIT"

  depends_on xcode: ["15.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/colored-sim"
    bin.install ".build/release/colored-sim-overlay"
    bin.install ".build/release/colored-sim-mcp"
  end

  test do
    assert_match "colored-sim", shell_output("#{bin}/colored-sim --help")
  end
end
