class Strapd < Formula
  desc "Developer utility belt for encoding, hashing, and data formatting tasks"
  homepage "https://github.com/dhwaneetbhatt/strapd"
  version "v1.5.0"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/dhwaneetbhatt/strapd/releases/download/v1.5.0/strapd-macos-x86_64.tar.gz"
      sha256 "b7f694db8fa64cfb9aa56d11c4a141a98898813ae9e88084f35b3c90b90f45f0"
    end

    on_arm do
      url "https://github.com/dhwaneetbhatt/strapd/releases/download/v1.5.0/strapd-macos-aarch64.tar.gz"
      sha256 "9b6184bd9f51a78033063382858f01a3744837ca728b424a1fe961e3f0ad26b8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dhwaneetbhatt/strapd/releases/download/v1.5.0/strapd-linux-x86_64.tar.gz"
      sha256 "9f830d56a9b808585a8110eb5eca06d5336bfe505c1e6b92e472cad265c5bad8"
    end

    on_arm do
      url "https://github.com/dhwaneetbhatt/strapd/releases/download/v1.5.0/strapd-linux-aarch64.tar.gz"
      sha256 "5cf73bfe90df7618a72ea58209ae0a5b3b26ecbc26211b27b6dcb4d816fe7453"
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
