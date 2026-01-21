class Strapd < Formula
  desc "Developer utility belt for encoding, hashing, and data formatting tasks"
  homepage "https://github.com/dhwaneetbhatt/strapd"
  version "11/merge"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/dhwaneetbhatt/strapd/releases/download/11/merge/strapd-macos-x86_64.tar.gz"
      sha256 "e77ffcd8d09c12e3d47a26a93564f35fd0404effb4453280ebe0f8388ab3ca18"
    end

    on_arm do
      url "https://github.com/dhwaneetbhatt/strapd/releases/download/11/merge/strapd-macos-aarch64.tar.gz"
      sha256 "c9a9fc9264348f9c166fae0b8ac5d16d0fbddcd39bd93205821882fa4e641c7a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dhwaneetbhatt/strapd/releases/download/11/merge/strapd-linux-x86_64.tar.gz"
      sha256 "a28e86b9134f8f00482a2e00c307a2db06f50e6a04a854a15f2951751a090e79"
    end

    on_arm do
      url "https://github.com/dhwaneetbhatt/strapd/releases/download/11/merge/strapd-linux-aarch64.tar.gz"
      sha256 "a62698312f1586fb7c80ce839d59840cc15ae4b399dd89800cd9fdbf8b06f44d"
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
