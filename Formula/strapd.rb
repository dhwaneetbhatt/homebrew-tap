class Strapd < Formula
  desc "Developer utility belt for encoding, hashing, and data formatting tasks"
  homepage "https://github.com/dhwaneetbhatt/strapd"
  version "v1.4.0"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/dhwaneetbhatt/strapd/releases/download/v1.4.0/strapd-macos-x86_64.tar.gz"
      sha256 "89f546935c5c914a0ff5a5778fa8bdd2f0ab046f8cb0ca7eb73800851fa16021"
    end

    on_arm do
      url "https://github.com/dhwaneetbhatt/strapd/releases/download/v1.4.0/strapd-macos-aarch64.tar.gz"
      sha256 "68e3f7dae6357519447a839cf264b1d0afb105c63357cfc0f55e1fde61c19b09"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dhwaneetbhatt/strapd/releases/download/v1.4.0/strapd-linux-x86_64.tar.gz"
      sha256 "a4d8956ad410cd18430a4d5290e848da080af159a30fb89fb8af0fbe77e6fdce"
    end

    on_arm do
      url "https://github.com/dhwaneetbhatt/strapd/releases/download/v1.4.0/strapd-linux-aarch64.tar.gz"
      sha256 "2f1d3c76d96623867f4913530cffc0d08aa947108bdcedf4854aa21099a5360f"
    end
  end

  def install
    bin.install "strapd"
  end

  test do
    # Test basic functionality
    assert_match "HELLO WORLD", shell_output("#{bin}/strapd str upper 'hello world'")

    # Test version output
    system bin/"strapd", "--version"

    # Test help output
    system bin/"strapd", "--help"

    # Test UUID generation
    output = shell_output("#{bin}/strapd uuid v4")
    assert_match(/^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i, output.strip)

    # Test encoding
    assert_match "aGVsbG8=", shell_output("#{bin}/strapd base64 encode hello")
  end
end
