require 'formula'

class Freetype < Formula
  homepage 'http://www.freetype.org'
  url 'http://downloads.sf.net/project/freetype/freetype2/2.4.10/freetype-2.4.10.tar.gz'
  sha1 '44dba26ff965b1cd1c62e480fdefaeca62ed33da'

  keg_only :provided_by_osx unless MacOS.x11_installed?

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end

  def test
    system "#{bin}/freetype-config --ftversion"
  end
end
