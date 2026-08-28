class Razerpad < Formula
  desc "Fan-curve and Chroma lighting control for the Razer Laptop Cooling Pad"
  homepage "https://github.com/ehog/razerpad-mac"
  url "https://github.com/ehog/razerpad-mac/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "1a916f6182c1cb69f36fb70dea50c51d61dda72df27602837d84b760fa5d887a"
  license "MIT"
  head "https://github.com/ehog/razerpad-mac.git", branch: "main"

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
