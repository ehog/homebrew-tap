class Razerpad < Formula
  desc "Fan-curve and Chroma lighting control for the Razer Laptop Cooling Pad"
  homepage "https://github.com/ehog/razerpad"
  url "https://github.com/ehog/razerpad/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "ab848497c7cdba16103699cf836a1f5a69435ed1998f081ed94bbe0e2dd4afba"
  license "MIT"
  head "https://github.com/ehog/razerpad.git", branch: "main"

  def install
    system "make", "razerpad"
    bin.install "razerpad"
  end

  service do
    run [opt_bin/"razerpad"]
    keep_alive true
    log_path var/"log/razerpad.log"
    error_log_path var/"log/razerpad.log"
  end

  test do
    system bin/"razerpad", "-h"
  end
end
