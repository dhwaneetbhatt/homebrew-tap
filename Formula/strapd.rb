class Strapd < Formula
  desc "Developer utility belt for encoding, hashing, and data formatting tasks"
  homepage "https://github.com/dhwaneetbhatt/strapd"
  version "1.2.0"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/dhwaneetbhatt/strapd/releases/download/v1.2.0/strapd-macos-x86_64.tar.gz"
      sha256 "40660eb299ba5345d18fa40c749ea77d5d590bb64217b6eb051d84ce457e5006"
    end

    on_arm do
      url "https://github.com/dhwaneetbhatt/strapd/releases/download/v1.2.0/strapd-macos-aarch64.tar.gz"
      sha256 "6072f38ac4a977b22a0844fe8aef0466bc805ccebf8ed0bb9f45ab0e84b11e3c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dhwaneetbhatt/strapd/releases/download/v1.2.0/strapd-linux-x86_64.tar.gz"
      sha256 "0eb2c43fde7afae3be942e59124ed92b06892e4397cdcb9cedc1743e4fd22cc3"
    end

    on_arm do
      url "https://github.com/dhwaneetbhatt/strapd/releases/download/v1.2.0/strapd-linux-aarch64.tar.gz"
      sha256 "168e519960ef71c57cb57d6506c87c02b26eb4262ed0d1e49f5f0ed05ce0031a"
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
