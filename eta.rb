class Eta < Formula
  desc "Eta - Haskell on the JVM"
  homepage "http://eta-lang.org/"
  url "https://github.com/typelead/eta/archive/0.0.6b5.tar.gz"
  sha256 "03ee19bb8ede664647c9fe358b89c7c90e5870379a91b4556d3a60208bb4d002"
  version "0.0.6b5"


  bottle :unneeded

  def install
    bin.install "eta"
  end

  test do
    system "#{bin}/eta", "--version"
  end
end