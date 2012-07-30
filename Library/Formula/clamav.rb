require 'formula'

class Clamav < Formula
  homepage 'http://www.clamav.net/'
  url 'http://downloads.sourceforge.net/clamav/clamav-0.97.5.tar.gz'
  sha1 '1bb317ead4a1a677a9a11a063fc35a63f22309e9'

  def patches
    # Patches to fix runtime abort bug in clamd on PowerPC.
    # See: https://wwws.clamav.net/bugzilla/show_bug.cgi?id=1921
    "https://wwws.clamav.net/bugzilla/attachment.cgi?id=1243"
  end

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
