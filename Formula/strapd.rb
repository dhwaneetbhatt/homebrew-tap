class Strapd < Formula
  desc "Developer utility belt for encoding, hashing, and data formatting tasks"
  homepage "https://github.com/dhwaneetbhatt/strapd"
  version "v1.3.0"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/dhwaneetbhatt/strapd/releases/download/v1.3.0/strapd-macos-x86_64.tar.gz"
      sha256 "7f34aebcbef94e7b188e01952007de387d8ec0ca709e11290c9ddc01a4be705a"
    end

    on_arm do
      url "https://github.com/dhwaneetbhatt/strapd/releases/download/v1.3.0/strapd-macos-aarch64.tar.gz"
      sha256 "27312adc75ad2762868b90b854275019114c1e8ccfffd0d82aeaf3013436f1a0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dhwaneetbhatt/strapd/releases/download/v1.3.0/strapd-linux-x86_64.tar.gz"
      sha256 "49df41b3650aac9febc33fbcc7a8a6db50a3cce110ace3307cb2fd2b190fd15e"
    end

    on_arm do
      url "https://github.com/dhwaneetbhatt/strapd/releases/download/v1.3.0/strapd-linux-aarch64.tar.gz"
      sha256 "6a0b0eab8e0b1bdf4d40efc85f0278bb651f71962fb2f1eeb8150e7842da0443"
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
