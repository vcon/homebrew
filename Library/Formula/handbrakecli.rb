require 'formula'

class Handbrakecli <Formula
   # @@dmgversion = 'svn3606'
   @@dmgversion = '0.9.6'
   @@osxversion = '6'
   @@arch = 'x86_64'
   @@dmgname = "HandBrake-#{@@dmgversion}-MacOSX.#{@@osxversion}_CLI_#{@@arch}"
   if /svn/.match(@@dmgversion)
      @@dmgurl = 'https://build.handbrake.fr/job/Mac/lastSuccessfulBuild/artifact/trunk/packages/'+@@dmgname+'.dmg'
   else
      @@dmgurl = 'http://handbrake.fr/rotation.php?file='+@@dmgname+'.dmg'
   end

   homepage 'http://handbrake.fr/'
   url @@dmgurl, :using => NoUnzipCurlDownloadStrategy
   version "#{/svn/.match(@@dmgversion) ? @@dmgversion.sub(/svn/,'') : @@dmgversion}"
   md5 'bfec57baa4a9e6f064cd00853964852e'

   # don't strip binaries
   skip_clean ['bin']

   def install
      system "hdiutil attach #{File.basename(@@dmgurl)}"
      bin.mkdir
      cp "/Volumes/#{@@dmgname}/HandBrakeCLI", (bin+'HandBrakeCLI')
      chmod 0555, (bin+'HandBrakeCLI')
      system "hdiutil detach /Volumes/#{@@dmgname}"
   end
end
