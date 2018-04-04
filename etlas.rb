class Etlas < Formula
  desc "Etlas, the build tool and package manager for the Eta programming language"
  homepage "https://eta-lang.org/"
  url "https://github.com/typelead/etlas/archive/1.2.0.0.tar.gz"
  sha256 "980302220b55fbe5270b62d6adafaeff280114333a5d90c591a9221cd6bba3a0"
  version "1.2.0.0"
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