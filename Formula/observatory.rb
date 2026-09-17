class Observatory < Formula
  desc "Explain what a code change affects before it is merged"
  homepage "https://github.com/kraftaa/codebase-observatory"
  url "https://github.com/kraftaa/codebase-observatory/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "1ca8d2e8753dcdf5f1d1322c93bae3b187cc5d67c613e0372662ce313f314fbd"
  license "Apache-2.0"

  depends_on "node"

  resource "typescript" do
    url "https://registry.npmjs.org/typescript/-/typescript-5.9.3.tgz"
    sha256 "10e108c9cf7d5f2879053dff18515fb405abf2ccef63eaaf017d9c571687a1d3"
  end

  def install
    libexec.install "bin", "scripts", "ui", "package.json"
    resource("typescript").stage do
      (libexec/"node_modules/typescript").install Dir["*"]
    end
    bin.install_symlink libexec/"bin/observatory.mjs" => "observatory"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/observatory --version").strip
    assert_match "observatory review", shell_output("#{bin}/observatory --help")
    assert_path_exists libexec/"ui/review.html"

    fixture = testpath/"fixture"
    fixture.mkpath
    (fixture/"token.ts").write "export const token = 1;\n"
    system "git", "-C", fixture, "init", "-b", "main"
    system "git", "-C", fixture, "add", "token.ts"
    system "git", "-C", fixture, "-c", "user.name=Observatory Test",
           "-c", "user.email=observatory@example.test", "commit", "-m", "baseline"
    (fixture/"token.ts").open("w") { |file| file.write "export const token = 2;\n" }

    output = shell_output("#{bin}/observatory impact --repo #{fixture} --base HEAD --working-tree --json")
    assert_match '"schema_version": 1', output
    assert_match '"changed_symbols": 1', output
  end
end
