class Botgate < Formula
  desc "Evidence-first Web Bot Auth conformance and coverage analyzer"
  homepage "https://github.com/kraftaa/botgate"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/kraftaa/botgate/releases/download/v0.3.0/botgate-aarch64-apple-darwin.tar.xz"
      sha256 "1975c26c9cae67eb90926bce39f7cffffcd504bfdb4604e8fc57b46a7b380828"
    end
    if Hardware::CPU.intel?
      url "https://github.com/kraftaa/botgate/releases/download/v0.3.0/botgate-x86_64-apple-darwin.tar.xz"
      sha256 "900283981af92688b44678765d687a9c6f54542944b94d50fb53b809d4ad6dea"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/kraftaa/botgate/releases/download/v0.3.0/botgate-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "9486d954845399d86054c32ecf11e5f56ccf563b1311080caa916e75af82f588"
    end
    if Hardware::CPU.intel?
      url "https://github.com/kraftaa/botgate/releases/download/v0.3.0/botgate-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "8b344b3da3d2a427307fe61914a98d9a827a48c66a10919ddb6292468e099bec"
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
