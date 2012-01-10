require 'formula'

class Clamav < Formula
  url 'http://downloads.sourceforge.net/clamav/clamav-0.97.3.tar.gz'
  homepage 'http://www.clamav.net/'
  md5 '5cf25ed7778fa0cb6b140ad8f009befb'

  def patches
    # Patches to fix runtime abort bug in clamd on PowerPC.
    # See: https://wwws.clamav.net/bugzilla/show_bug.cgi?id=1921
    "https://wwws.clamav.net/bugzilla/attachment.cgi?id=1243"
  end

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
    system "make install"
  end
end
