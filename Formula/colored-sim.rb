class ColoredSim < Formula
  desc "Colored borders for iOS Simulators — know which agent owns which simulator"
  homepage "https://github.com/ricardorios87/colored-simulators"
  url "https://github.com/ricardorios87/colored-simulators/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "13738660d963d2683e0d82638782182f6637da3bc46b00c76f4c6145486f939c"
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
