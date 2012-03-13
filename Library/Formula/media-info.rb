require 'formula'

class MediaInfo < Formula
  homepage 'http://mediainfo.sourceforge.net'
  url 'http://downloads.sourceforge.net/mediainfo/MediaInfo_CLI_0.7.54_GNU_FromSource.tar.bz2'
  md5 '91aefa130e98cd639452a4011578d761'

  depends_on 'pkg-config' => :build

  def install
    system "./CLI_Compile.sh --prefix=#{prefix}"
    system "cd MediaInfo/Project/GNU/CLI && make install"
  end
end
