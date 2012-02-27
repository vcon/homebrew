require 'formula'

class Sshfs < Formula
  homepage 'http://fuse.sourceforge.net/sshfs.html'
  url 'https://github.com/fuse4x/sshfs.git', :tag => 'sshfs_2_3_0'
  version '2.3.0'

  depends_on 'pkg-config' => :build
  depends_on 'fuse4x'
  depends_on 'glib'
  depends_on "automake" if MacOS.xcode_version >= "4.3"

  def install
    ENV['ACLOCAL'] = "aclocal -I/usr/share/aclocal -I#{HOMEBREW_PREFIX}/share/aclocal"
    ENV['AUTOCONF'] = "autoconf"
    ENV['AUTOMAKE'] = "automake"
    system "autoreconf", "--force", "--install"

    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end

  def caveats
    <<-EOS.undent
      Make sure to follow the directions given by `brew info fuse4x-kext`
      before trying to use a FUSE-based filesystem.
    EOS
  end
end
