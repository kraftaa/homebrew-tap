class Botgate < Formula
  desc "Evidence-first Web Bot Auth conformance and coverage analyzer"
  homepage "https://github.com/kraftaa/botgate"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/kraftaa/botgate/releases/download/v0.2.1/botgate-aarch64-apple-darwin.tar.xz"
      sha256 "9358c4a1efcd378bf544f928827ada26fc99deb8ae87b48e92b300ba1c770e76"
    end
    if Hardware::CPU.intel?
      url "https://github.com/kraftaa/botgate/releases/download/v0.2.1/botgate-x86_64-apple-darwin.tar.xz"
      sha256 "a8d8d7e61a3265858aa0fbcdc0725a9ad5b6cc19bd2a7caf347ac6b4c8b09fdb"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/kraftaa/botgate/releases/download/v0.2.1/botgate-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "9bdc51b9fccbd2f9ea8bf850c1e6b1176febdf4f60fef3f5e4b9785cca36eb82"
    end
    if Hardware::CPU.intel?
      url "https://github.com/kraftaa/botgate/releases/download/v0.2.1/botgate-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "be5a6aefc5ae7ed6b330b6edaac685b863778bf2c494130dea70789e2fb0bb5c"
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
