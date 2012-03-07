require 'formula'

class Fftw < Formula
  homepage 'http://www.fftw.org'
  url 'http://www.fftw.org/fftw-3.3.tar.gz'
  md5 '0728ab3ec0ebb06631ab3b80a5c3d130'

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
