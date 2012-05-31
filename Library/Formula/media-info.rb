require 'formula'

class MediaInfo < Formula
  homepage 'http://mediainfo.sourceforge.net'
  url 'http://downloads.sourceforge.net/mediainfo/MediaInfo_CLI_0.7.58_GNU_FromSource.tar.bz2'
  md5 'c332b376fe397531be894287ec97aab2'

  depends_on 'pkg-config' => :build

  def install
    system "./CLI_Compile.sh --prefix=#{prefix}"
    system "cd MediaInfo/Project/GNU/CLI && make install"
  end
end
