class Etlas < Formula
  desc "Etlas, the build tool and package manager for the Eta programming language"
  homepage "https://eta-lang.org/"
  url "https://github.com/typelead/etlas/archive/1.5.1.0.tar.gz"
  sha256 "7913d29b0cf580f94b50c963d28c37f73df9062a1a143723a5bcad8909691c38"
  version "1.5.1.0"
  head "https://github.com/typelead/etlas.git"

  depends_on "haskell-stack" => :build

  resource "hackage-security" do
    url "https://api.github.com/repos/Jyothsnasrinivas/hackage-security/tarball/190438fa4433e8402dd0d2e0e2170dad02bcf65f"
    sha256 "b2dd1d4f49fee01611e2f743280948d0c59039862652f19b5d79613c10287bee"
  end

  def install
    unless build.head?
      resource("hackage-security").stage(buildpath/"hackage-security")
    end
    system "stack", "setup"
    system "stack", "install", "etlas", "--local-bin-path=#{bin}"
  end

  test do
    system "#{bin}/etlas", "--version"
  end
end
