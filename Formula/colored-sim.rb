class ColoredSim < Formula
  desc "Colored borders for iOS Simulators — know which agent owns which simulator"
  homepage "https://github.com/ricardorios87/colored-simulators"
  url "https://github.com/ricardorios87/colored-simulators/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "27e82f59a3fa9b19adb709c4bf254318efc6028d0483e326eabb5e118d791d75"
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
