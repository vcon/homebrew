require 'formula'

class Liboil < Formula
  homepage 'http://liboil.freedesktop.org/'
  url 'http://liboil.freedesktop.org/download/liboil-0.3.17.tar.gz'
  md5 '47dc734f82faeb2964d97771cfd2e701'

  depends_on 'pkg-config' => :build
  depends_on 'glib'

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-dependency-tracking"
    system "make"
    system "make install"
  end
end
