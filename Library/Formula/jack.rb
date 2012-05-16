require 'formula'

class Jack < Formula
  url 'http://www.grame.fr/~letz/jack-1.9.7.tar.bz2'
  homepage 'http://jackaudio.org'
  md5 '9759670feecbd43eeccf1c0f743ec199'

  depends_on 'celt'
  depends_on 'libsamplerate'

  # Default build assumes ppc+i386, changed to ppc only as it would fail when
  # compiling the i386 binary with ppc specific things (e.g., -mtune=7450)
  def patches
    { :p1 => ['https://raw.github.com/gist/2305104/dfc4fe70/jack-1.9.7_no_forced_use_of_ncurses.patch',
              'https://raw.github.com/gist/2305104/be0bcb69/jack-1.9.7_no_x86.patch']
    }

  end

  def install
    ENV['LINKFLAGS'] = ENV.ldflags
    system "./waf","configure","--prefix=#{prefix}"
    system "./waf","build"
    system "./waf","install"
  end
end
