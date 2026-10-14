class ArgoHold < Formula
  desc "Hold one Argo CD app's auto-sync off while a live change stays applied"
  homepage "https://github.com/markddavidoff/argo-hold"
  url "https://github.com/markddavidoff/argo-hold/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "603fa69ab8659b6c060792fcdb66e70871e22204b693983ea1f9228c98c1898c"
  license "MIT"

  depends_on "python@3.12"

  def install
    libexec.install Dir["scripts/*"]
    # The launcher runs `python3` from PATH, so put the formula's Python first.
    (bin/"argo-hold").write_env_script libexec/"argo-hold",
      PATH: "#{Formula["python@3.12"].opt_bin}:$PATH"
  end

  test do
    assert_match "argo-hold #{version}", shell_output("#{bin}/argo-hold --version")
  end
end
