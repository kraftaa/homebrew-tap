class Botgate < Formula
  desc "Test what Web Bot Auth signatures protect and whether servers enforce policy"
  homepage "https://github.com/kraftaa/botgate"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/kraftaa/botgate/releases/download/v0.4.3/botgate-aarch64-apple-darwin.tar.xz"
      sha256 "b48a64bda83243654fdc34ca77e0a205041ebe5d5cbc5733ebe5d5694f5029fa"
    end
    if Hardware::CPU.intel?
      url "https://github.com/kraftaa/botgate/releases/download/v0.4.3/botgate-x86_64-apple-darwin.tar.xz"
      sha256 "c47fd398d75e6ec14587645dfd66651ae30a545213c9b325ef680caeaea84d11"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/kraftaa/botgate/releases/download/v0.4.3/botgate-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "fc92d6c043f427761967adac3510038bbc21bbf1fb55776fd9b6a28404e5a421"
    end
    if Hardware::CPU.intel?
      url "https://github.com/kraftaa/botgate/releases/download/v0.4.3/botgate-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "9b597b774916d8f46fce1cf11d6868b0bd746ff58bb6879f1ea34c4a5ceaf9b7"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin":       {},
    "x86_64-pc-windows-gnu":     {},
    "x86_64-unknown-linux-gnu":  {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "botgate"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "botgate"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "botgate"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "botgate"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end

  test do
    assert_match "botgate #{version}", shell_output("#{bin}/botgate --version")
  end
end
