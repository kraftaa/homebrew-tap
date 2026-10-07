class Botgate < Formula
  desc "Test what Web Bot Auth signatures protect and whether servers enforce policy"
  homepage "https://github.com/kraftaa/botgate"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/kraftaa/botgate/releases/download/v0.4.1/botgate-aarch64-apple-darwin.tar.xz"
      sha256 "b05d30d933dff4f284b6d334ff621e71012007d4188a4c5a5f29f3dd7b557feb"
    end
    if Hardware::CPU.intel?
      url "https://github.com/kraftaa/botgate/releases/download/v0.4.1/botgate-x86_64-apple-darwin.tar.xz"
      sha256 "e4f65812eb0c38c440725b2a1791536e59aae83368725d2a3662fcc2bf13e9fb"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/kraftaa/botgate/releases/download/v0.4.1/botgate-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "2d1e4bb886b613a1685afbac7fb9c1977d2031fdb3e874ea0a2489095c0e09cb"
    end
    if Hardware::CPU.intel?
      url "https://github.com/kraftaa/botgate/releases/download/v0.4.1/botgate-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "a8001e9aa0660b8173dd880d052a000588a933db14ec3a030f43e7ca6801b79a"
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
