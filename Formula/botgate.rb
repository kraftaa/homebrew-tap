class Botgate < Formula
  desc "Test what Web Bot Auth signatures protect and whether servers enforce policy"
  homepage "https://github.com/kraftaa/botgate"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/kraftaa/botgate/releases/download/v0.4.2/botgate-aarch64-apple-darwin.tar.xz"
      sha256 "94fea0035147d56c0c2e351d95900dc8b4e894871363ac899497a3644bca8054"
    end
    if Hardware::CPU.intel?
      url "https://github.com/kraftaa/botgate/releases/download/v0.4.2/botgate-x86_64-apple-darwin.tar.xz"
      sha256 "c1f9bed9f959406a18b9be9a8b41afcf4b6dfe03bc03ad9552d78c59872f1b16"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/kraftaa/botgate/releases/download/v0.4.2/botgate-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "c93d927c8deeffb9d94d45649a50dee020758e1a16862c38a736221b86764c94"
    end
    if Hardware::CPU.intel?
      url "https://github.com/kraftaa/botgate/releases/download/v0.4.2/botgate-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "2bd64e527f418fb21f5026f5b4e7f7ba3e6dc1ac0bf0714a65dec4c472cf0c5f"
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
