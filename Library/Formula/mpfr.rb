require 'formula'

class Mpfr < Formula
  homepage 'http://www.mpfr.org/'
  url 'http://www.mpfr.org/mpfr-3.1.0/mpfr-3.1.0.tar.bz2'
  md5 '238ae4a15cc3a5049b723daef5d17938'

  depends_on 'gmp'

  def patches
    "http://www.mpfr.org/mpfr-3.1.0/allpatches"
  end

  def install
    args = ["--disable-dependency-tracking", "--prefix=#{prefix}"]

    system "./configure", *args
    system "make install"
  end
end
