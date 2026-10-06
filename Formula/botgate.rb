class Botgate < Formula
  desc "Evidence-first Web Bot Auth conformance and coverage analyzer"
  homepage "https://github.com/kraftaa/botgate"
  version "0.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/kraftaa/botgate/releases/download/v0.1.0/botgate-aarch64-apple-darwin.tar.xz"
      sha256 "6e9581fffa419708e5e59ac5a9efa20c0d530f1a459f5c44a60b13f66b5d200e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/kraftaa/botgate/releases/download/v0.1.0/botgate-x86_64-apple-darwin.tar.xz"
      sha256 "a454ffcf1a4c52fe68afd3f9c5653a330e1483f4572b6729cd749d32d770d738"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/kraftaa/botgate/releases/download/v0.1.0/botgate-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "fbc0263ac2521b8a59eccb1da7e3829059541766569c1f916fd3d2a9ab3c84b3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/kraftaa/botgate/releases/download/v0.1.0/botgate-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "aa46f92c64d16d83a8ba086545ef196aa275aa96c56dcaaae481a202394deda3"
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
end
