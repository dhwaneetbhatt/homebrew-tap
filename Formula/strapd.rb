class Strapd < Formula
  desc "Developer utility belt for encoding, hashing, and data formatting tasks"
  homepage "https://github.com/dhwaneetbhatt/strapd"
  version "1.5.1"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/dhwaneetbhatt/strapd/releases/download/v1.5.1/strapd-macos-x86_64.tar.gz"
      sha256 "6e785d9102996bd542d9019ce3a71bcb3ea07cbd71dc9f2e650a36776bad182d"
    end

    on_arm do
      url "https://github.com/dhwaneetbhatt/strapd/releases/download/v1.5.1/strapd-macos-aarch64.tar.gz"
      sha256 "73eb2b4c7f85270c274a1aaafe250e49acaa59b10b54d7be154fbe6cedb85bd6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dhwaneetbhatt/strapd/releases/download/v1.5.1/strapd-linux-x86_64.tar.gz"
      sha256 "63b451483075a7d08bb8b4c4a19eda511a289aad0967c93be5dd05f30c2fb927"
    end

    on_arm do
      url "https://github.com/dhwaneetbhatt/strapd/releases/download/v1.5.1/strapd-linux-aarch64.tar.gz"
      sha256 "877b86e1c943a23210f6505204cbb7c1cd7cc988108755dbabe5bc061cc27987"
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
