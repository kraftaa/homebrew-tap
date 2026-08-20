class EmbedParity < Formula
  include Language::Python::Virtualenv

  desc "Compare SentenceTransformers embeddings with a TEI deployment"
  homepage "https://kraftaa.github.io/parity-checker/"
  url "https://files.pythonhosted.org/packages/1e/13/806c4b56887c9d36b67661a2ba17e647ce57ba8fded92f80cbbd9abce5a5/embed_parity-0.3.0-py3-none-any.whl"
  sha256 "98d92e38303b4418bd4512ed9362cbb9cf8e60bbaef629b915c1f9faedadf3f4"
  license "MIT"

  depends_on arch: :arm64
  depends_on "libyaml"
  depends_on :macos
  depends_on "python@3.12"

  resource "sentence-transformers" do
    url "https://files.pythonhosted.org/packages/04/fe/9d19b01fe87945f9455c617bf5d33dfbf29fe06ab6580bc0bea06080c788/sentence_transformers-6.0.0-py3-none-any.whl"
    sha256 "b974ac67523ea2a955afa87b1024129305472bd884367dcc969261cb086790e9"
  end

  resource "huggingface-hub" do
    url "https://files.pythonhosted.org/packages/51/0e/eafef18f1a75e125e68395db21131db0cf868a128ecd2fce69b4df6c584b/huggingface_hub-1.28.0-py3-none-any.whl"
    sha256 "58a8bacb03072edfc38067065e9dc24bbb34805410fcd36a1632de0b329660bb"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/fb/e2/79c688af8b210d232694e31e59da9f6ec747bae31c3f5946e4e9b98860d5/click-8.4.2-py3-none-any.whl"
    sha256 "e6f9f66136c816745b9d65817da91d61d957fb16e02e4dcd0552553c5a197b76"
  end

  resource "hf-xet" do
    url "https://files.pythonhosted.org/packages/4b/69/55b8dcf636142ae660fec1869fcac14c4da2e8412e14d6eee1523be77e9f/hf_xet-1.6.0-cp38-abi3-macosx_11_0_arm64.whl"
    sha256 "f0906082d9932ae0c0057fa194041c22b4e2cdb46b2592ef3b91f020d62a081a"
  end

  resource "httpx" do
    url "https://files.pythonhosted.org/packages/2a/39/e50c7c3a983047577ee07d2a9e53faf5a69493943ec3f6a384bdc792deb2/httpx-0.28.1-py3-none-any.whl"
    sha256 "d909fcccc110f8c7faf814ca82a9a4d816bc5a6dbfea25d6591d6985b8ba59ad"
  end

  resource "httpcore" do
    url "https://files.pythonhosted.org/packages/7e/f5/f66802a942d491edb555dd61e3a9961140fd64c90bce1eafd741609d334d/httpcore-1.0.9-py3-none-any.whl"
    sha256 "2d400746a40668fc9dec9810239072b40b4484b640a8c38fd654a024c7a1bf55"
  end

  resource "transformers" do
    url "https://files.pythonhosted.org/packages/d8/43/81355710a4c84e9420e11a86d41a5364deb561f2ef36dfdf254a07371bbb/transformers-5.15.0-py3-none-any.whl"
    sha256 "d7f007736f67749ae9490c4f8cb5d30b452ae2d68c8675e50ba8d63ea7feb107"
  end

  resource "tokenizers" do
    url "https://files.pythonhosted.org/packages/2e/47/174dca0502ef88b28f1c9e06b73ce33500eedfac7a7692108aec220464e7/tokenizers-0.22.2-cp39-abi3-macosx_11_0_arm64.whl"
    sha256 "1e418a55456beedca4621dbab65a318981467a2b188e982a23e117f115ce5001"
  end

  resource "filelock" do
    url "https://files.pythonhosted.org/packages/a7/8e/50f46a9c0ce8d2861a394c1347caae037ea0431d2f67d7feb151cbc4649a/filelock-3.32.3-py3-none-any.whl"
    sha256 "7f0ca4bcc0e181c60dbbd8aa9ab5b120ebb99e4e064e83636340056f833a1f09"
  end

  resource "fsspec" do
    url "https://files.pythonhosted.org/packages/fd/3c/6a2bf344106328fd04963664a60b9bb6496fc25df8e962fcdc1367285fb9/fsspec-2026.7.0-py3-none-any.whl"
    sha256 "b57ddbafedfaef7018c1ecab32aa200a9d7ca26b77965f64e48b70061249d279"
  end

  resource "h11" do
    url "https://files.pythonhosted.org/packages/04/4b/29cac41a4d98d144bf5f6d33995617b185d14b22401f75ca86f384e87ff1/h11-0.16.0-py3-none-any.whl"
    sha256 "63cf8bbe7522de3bf65932fda1d9c2772064ffb3dae62d55932da54b31cb6c86"
  end

  resource "numpy" do
    url "https://files.pythonhosted.org/packages/f3/f4/29e78102a80601cf034d4e9767022cffeca2c3b4c926e1754572ca95593d/numpy-2.5.2-cp312-cp312-macosx_14_0_arm64.whl"
    sha256 "6e8172ddfcf5cf74b811d372b570b83c60bd2de87a6fbfbebdadb4a9bd9c6cbb"
  end

  resource "packaging" do
    url "https://files.pythonhosted.org/packages/63/34/ba1c580383c9eada3711951fef0795c80b829a078d72188184bcab9dd527/packaging-26.3-py3-none-any.whl"
    sha256 "d7193f7c8e4e93f444fde0262bf90af30e16fa0ad0ad44cb553c87339b23cd1c"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/89/a0/6cf41a19a1f2f3feab0e9c0b74134aa2ce6849093d5517a0c550fe37a648/pyyaml-6.0.3-cp312-cp312-macosx_11_0_arm64.whl"
    sha256 "fc09d0aa354569bc501d4e787133afc08552722d3ab34836a80547331bb5d4a0"
  end

  resource "regex" do
    url "https://files.pythonhosted.org/packages/b3/63/4cab4d7f2d384a144d420b763d97674cb70619c878ea6fcd7640d0e62143/regex-2026.7.19-cp312-cp312-macosx_11_0_arm64.whl"
    sha256 "d7da47a0f248977f08e2cb659ff3c17ddc13a4d39b3a7baa0a81bf5b415430f6"
  end

  resource "safetensors" do
    url "https://files.pythonhosted.org/packages/f5/b1/fa7c600e7dceae12e9606c7578cbc9ff1e1ed55844883ee5c92205e86226/safetensors-0.8.0-cp310-abi3-macosx_11_0_arm64.whl"
    sha256 "c80201d22cbf405b80647a60ada77bba06c8fba2da2743ba1e89cdcc39a81f25"
  end

  resource "scikit-learn" do
    url "https://files.pythonhosted.org/packages/cc/d5/2b5148f2279196775e1db2aeb85d14b70ac80e7e32b3b28e7ebeafb0901d/scikit_learn-1.9.0-cp312-cp312-macosx_12_0_arm64.whl"
    sha256 "5be45aa4a42a68a533913a6ed736cf309de2226411c79ef8d609a5456f1939b1"
  end

  resource "joblib" do
    url "https://files.pythonhosted.org/packages/7b/91/984aca2ec129e2757d1e4e3c81c3fcda9d0f85b74670a094cc443d9ee949/joblib-1.5.3-py3-none-any.whl"
    sha256 "5fc3c5039fc5ca8c0276333a188bbd59d6b7ab37fe6632daa76bc7f9ec18e713"
  end

  resource "narwhals" do
    url "https://files.pythonhosted.org/packages/7e/85/a5bfaebfd305ac18b57b0854d74e37e586809061a91fda62f0bd50c8518e/narwhals-2.24.0-py3-none-any.whl"
    sha256 "42fdedf44e5b2ca7505630d45b4ac3058f38d8485cba9fe1652ca23152df7489"
  end

  resource "scipy" do
    url "https://files.pythonhosted.org/packages/9b/2d/11dd93d21e147a73ba22bd75c0b9208d3a2e0ec76d53170ce7d9029b1015/scipy-1.18.0-cp312-cp312-macosx_14_0_arm64.whl"
    sha256 "9ab7b758be6940954a713ee466e2043e9f6e2ed965c1fce5c91039f4be3d90a9"
  end

  resource "threadpoolctl" do
    url "https://files.pythonhosted.org/packages/32/d5/f9a850d79b0851d1d4ef6456097579a9005b31fea68726a4ae5f2d82ddd9/threadpoolctl-3.6.0-py3-none-any.whl"
    sha256 "43a0b8fd5a2928500110039e43a5eed8480b918967083ea48dc3ab9f13c4a7fb"
  end

  resource "torch" do
    url "https://files.pythonhosted.org/packages/c4/3a/ed0f4d4d1dcde03bced7aac9a28e800abcdc0cbd06b6775044c9fbd877b7/torch-2.13.0-cp312-cp312-macosx_14_0_arm64.whl"
    sha256 "2fe228aba290d14b9f31b049be550dbd469c3fd3013d7a19705b30454da97027"
  end

  resource "networkx" do
    url "https://files.pythonhosted.org/packages/9e/c9/b2622292ea83fbb4ec318f5b9ab867d0a28ab43c5717bb85b0a5f6b3b0a4/networkx-3.6.1-py3-none-any.whl"
    sha256 "d47fbf302e7d9cbbb9e2555a0d267983d2aa476bac30e90dfbe5669bd57f3762"
  end

  resource "setuptools" do
    url "https://files.pythonhosted.org/packages/95/9c/c510029fc6ef33a6275cd2c5d3cecd6613dfd6aa401d57c54f1c18852ccf/setuptools-84.0.0-py3-none-any.whl"
    sha256 "51a52592b3b99e102b609654876bd65f19f999935166d1352678931132b0c670"
  end

  resource "sympy" do
    url "https://files.pythonhosted.org/packages/a2/09/77d55d46fd61b4a135c444fc97158ef34a095e5681d0a6c10b75bf356191/sympy-1.14.0-py3-none-any.whl"
    sha256 "e091cc3e99d2141a0ba2847328f5479b05d94a6635cb96148ccb3f34671bd8f5"
  end

  resource "mpmath" do
    url "https://files.pythonhosted.org/packages/43/e3/7d92a15f894aa0c9c4b49b8ee9ac9850d6e63b03c9c32c0367a13ae62209/mpmath-1.3.0-py3-none-any.whl"
    sha256 "a0b2b9fe80bbcd81a6647ff13108738cfb482d481d826cc0e02f5b35e5c88d2c"
  end

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/f9/1c/01bfd571a64e7f270e6bab5e33777debe0edc56759233ce84f27dec92d14/tqdm-4.70.0-py3-none-any.whl"
    sha256 "7f585706bfddbdebf89daac705b2dfcc16890130727d3197ca62c732b4310953"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/49/d3/b8441a820a491ddfc024b0b0cf0393375b75ea13866d9c66727e54c2fc80/typing_extensions-4.16.0-py3-none-any.whl"
    sha256 "481caa481374e813c1b176ada14e97f1f67a4539ce9cfeb3f350d78d6370c2e8"
  end

  resource "anyio" do
    url "https://files.pythonhosted.org/packages/da/35/f2287558c17e29fafc8ef3daf819bb9834061cfa43bff8014f7df7f63bdc/anyio-4.14.2-py3-none-any.whl"
    sha256 "9f505dda5ac9f0c8309b5e8bd445a8c2bf7246f3ce950121e45ea15bc41d1494"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/57/b0/0e52c878c53f245edd3a11020f20979b3f490f245af532c7cae3027754b5/idna-3.19-py3-none-any.whl"
    sha256 "815e7be7a7806d54abb586dc943addc79e8b2ee16915059658cbeff4b1b43bf4"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/0b/a7/71ac2cff56fec219ed242bb11b8efb69fcc4bec75db06fb7bfe35de520e6/certifi-2026.7.22-py3-none-any.whl"
    sha256 "62f22742b58a1a33014a2b6b706588a8d7e2a88ae7bd1a6ebe8c992928483775"
  end

  resource "jinja2" do
    url "https://files.pythonhosted.org/packages/62/a1/3d680cbfd5f4b8f15abc1d571870c5fc3e594bb582bc3b64ea099db13e56/jinja2-3.1.6-py3-none-any.whl"
    sha256 "85ece4451f492d0c13c5dd7c13a64681a86afae63a5f347908daf103ce6d2f67"
  end

  resource "markupsafe" do
    url "https://files.pythonhosted.org/packages/9a/81/7e4e08678a1f98521201c3079f77db69fb552acd56067661f8c2f534a718/markupsafe-3.0.3-cp312-cp312-macosx_11_0_arm64.whl"
    sha256 "1872df69a4de6aead3491198eaf13810b565bdbeec3ae2dc8780f14458ec73ce"
  end

  resource "typer" do
    url "https://files.pythonhosted.org/packages/43/89/9518bc0c3929bee36b3a4a8e3daddd6e03f92f9961c66d4983b837160543/typer-0.27.1-py3-none-any.whl"
    sha256 "53150287edd11baeb4e4722c8e394fcdf8181c0ae89485cba8d25c778d5edd56"
  end

  resource "annotated-doc" do
    url "https://files.pythonhosted.org/packages/3e/30/e900b21425a860e195f32e37657aa1f7c7f2b1bfb26f03ca209b90933c06/annotated_doc-0.0.5-py3-none-any.whl"
    sha256 "117bac03a25ede5df5440e855b32d556049ca169ead221505badf432fed4b101"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/82/3b/64d4899d73f91ba49a8c18a8ff3f0ea8f1c1d75481760df8c68ef5235bf5/rich-15.0.0-py3-none-any.whl"
    sha256 "33bd4ef74232fb73fe9279a257718407f169c09b78a87ad3d296f548e27de0bb"
  end

  resource "pygments" do
    url "https://files.pythonhosted.org/packages/71/46/17f022dd3e953bf20a04a028a21ec746d942f8d2af30fa0f124fa0e6a684/pygments-2.21.0-py3-none-any.whl"
    sha256 "2363c69b61c4a97c838da3b130dcd6468f4848992b21a82f2a63ec34377137d9"
  end

  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/b3/81/4da04ced5a082363ecfa159c010d200ecbd959ae410c10c0264a38cac0f5/markdown_it_py-4.2.0-py3-none-any.whl"
    sha256 "9f7ebbcd14fe59494226453aed97c1070d83f8d24b6fc3a3bcf9a38092641c4a"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/b3/38/89ba8ad64ae25be8de66a6d463314cf1eb366222074cfda9ee839c56a4b4/mdurl-0.1.2-py3-none-any.whl"
    sha256 "84008a41e51615a49fc9966191ff91509e3c40b939176e643fd50a5c2196b8f8"
  end

  resource "shellingham" do
    url "https://files.pythonhosted.org/packages/e0/f9/0595336914c5619e5f28a1fb793285925a8cd4b432c9da0a987836c7f822/shellingham-1.5.4-py2.py3-none-any.whl"
    sha256 "7ecfff8f2fd72616f7481040475a65b2bf8af90a56c89140852d1120324e8686"
  end

  def install
    venv = virtualenv_create(libexec, "python3.12")
    wheelhouse = buildpath/"wheelhouse"
    resources.each { |resource| resource.stage(wheelhouse) }

    wheels = wheelhouse.glob("*.whl")
    system venv.root/"bin/python", "-m", "pip", "install", "--no-deps", *wheels
    system venv.root/"bin/python", "-m", "pip", "install", "--no-deps", buildpath/downloader.basename
    bin.install_symlink libexec/"bin/embed-parity"
  end

  test do
    assert_match "embed-parity #{version}", shell_output("#{bin}/embed-parity --version")
    system libexec/"bin/python", "-c", "import sentence_transformers"
  end
end
