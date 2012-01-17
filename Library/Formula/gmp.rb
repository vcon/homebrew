require 'formula'

class Gmp < Formula
  url 'http://ftpmirror.gnu.org/gmp/gmp-5.0.2.tar.bz2'
  mirror 'http://ftp.gnu.org/gnu/gmp/gmp-5.0.2.tar.bz2'
  homepage 'http://gmplib.org/'
  sha1 '2968220e1988eabb61f921d11e5d2db5431e0a35'

  def options
    [
      ["--skip-check", "Do not run 'make check' to verify libraries."]
    ]
  end

  def install
    # Reports of problems using gcc 4.0 on Leopard
    # https://github.com/mxcl/homebrew/issues/issue/2302
    # Also force use of 4.2 on 10.6 in case a user has changed the default
    # Do not force if xcode > 4.2 since it does not have /usr/bin/gcc-4.2 as default
    unless MacOS.xcode_version >= "4.2"
      ENV.gcc_4_2
    end

    args = ["--prefix=#{prefix}", "--enable-cxx"]

    ENV.append_to_cflags '-force_cpusubtype_ALL'

    system "./configure", *args
    system "make"
    ENV.j1 # Doesn't install in parallel on 8-core Mac Pro
    system "make install"

    # Different compilers and options can cause tests to fail even
    # if everything compiles, so yes, we want to do this step.
    system "make check" unless ARGV.include? "--skip-check"
  end
end
