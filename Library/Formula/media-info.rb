require 'formula'

class MediaInfo < Formula
  homepage 'http://mediainfo.sourceforge.net'
  url 'http://downloads.sourceforge.net/mediainfo/MediaInfo_CLI_0.7.53_GNU_FromSource.tar.bz2'
  md5 '0b556ac5370d939a4ee07732bc9281b1'

  depends_on 'pkg-config' => :build

  def install
    system "./CLI_Compile.sh --prefix=#{prefix}"
    system "cd MediaInfo/Project/GNU/CLI && make install"
  end
end
