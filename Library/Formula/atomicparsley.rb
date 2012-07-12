require 'formula'

class Atomicparsley < Formula
  homepage 'http://bitbucket.org/wez/atomicparsley/overview/'
  #url 'https://bitbucket.org/wez/atomicparsley/get/0.9.4.tar.bz2'
  #sha1 'd38dee8fddf1d554d07a18edb28635c4eb6bedde'
  url 'https://bitbucket.org/wez/atomicparsley/get/fd7a76c53eb8.tar.bz2'
  md5 '4c271090aa5a36596696a5d460f2c6fe'
  version '2011.03.23'

  head 'https://bitbucket.org/wez/atomicparsley', :using => :hg

  depends_on :automake
  depends_on :libtool

  def install
    system "./autogen.sh"
    system "./configure", "--prefix=#{prefix}",
                          "--disable-debug",
                          "--disable-universal"
    system "make install"
  end
end
