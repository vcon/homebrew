require 'formula'

class Fftw < Formula
  homepage 'http://www.fftw.org'
  url 'http://www.fftw.org/fftw-3.3.2.tar.gz'
  md5 '6977ee770ed68c85698c7168ffa6e178'

  def install
    args = ["--enable-shared",
            "--disable-debug",
            "--prefix=#{prefix}",
            "--enable-threads",
            "--disable-dependency-tracking"]

    # check for gfortran
    args << "--disable-fortran" unless which 'gfortran'

    # enable-altivec
    system "./configure", "--enable-single",
                          "--enable-altivec",
                          "--enable-fma",
                          *args
    system "make install"

    #wtf file?
    (info+'dir').unlink
  end
end
