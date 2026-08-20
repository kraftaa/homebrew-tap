class WhyslowDb < Formula
  include Language::Python::Virtualenv

  desc "Reconstruct PostgreSQL incidents and evaluate agent safety"
  homepage "https://github.com/kraftaa/whyslow"
  url "https://github.com/kraftaa/whyslow/releases/download/v0.5.2/whyslow_db-0.5.2.tar.gz"
  sha256 "bfeb02d4d45288d033eef2a33e154bd4f11cae818608ee1cf73110f82838bb90"
  license "MIT"

  depends_on "libpq"
  depends_on "python@3.14"

  resource "psycopg2-binary" do
    url "https://files.pythonhosted.org/packages/2a/60/a3624f79acea344c16fbef3a94d28b89a8042ddfb8f3e4ca83f538671409/psycopg2_binary-2.9.12.tar.gz"
    sha256 "5ac9444edc768c02a6b6a591f070b8aae28ff3a99be57560ac996001580f294c"
  end

  def install
    ENV.prepend_path "PATH", Formula["libpq"].opt_bin
    virtualenv_install_with_resources
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/whyslow --version")
    assert_match "pg_cross_tenant_access_v1", shell_output("#{bin}/whyslow benchmark list")
  end
end
