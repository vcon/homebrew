require 'formula'

class Libmikmod < Formula
  homepage 'http://mikmod.shlomifish.org'
  url 'http://mikmod.shlomifish.org/files/libmikmod-3.2.0.tar.gz'
  sha256 '734c8490bbf9b0c587920b92414dcfa3c2267838a0cdf698d5f1fb6bba8f661e'

  depends_on :x11

  def options
    [[ '--with-debug', 'Enable debugging symbols']]
  end

  def install
    if ARGV.include? '--with-debug' then
      (ENV.compiler == :clang) ? ENV.Og : ENV.O2
    end

    # OSX has CoreAudio, but ALSA is not for this OS nor is SAM9407 nor ULTRA.
    args = %W[
      --prefix=#{prefix}
      --disable-alsa
      --disable-sam9407
      --disable-ultra
    ]
    args << '--with-debug' if ARGV.include? '--with-debug'
    mkdir 'macbuild' do
      system "../configure", *args
      system "make install"
    end
  end
end
