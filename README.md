Homebrew
========
Features, usage and installation instructions are [summarized on the homepage][home].

This is a [fork adding basic PowerPC support][ppcfork], so it will update from
that fork by default instead of the master Homebrew branch.

Quick Install to /usr/local
---------------------------
To quickly install the PowerPC branch under /usr/local, use the following:

  `curl -Lsf http://github.com/sceaga/homebrew/tarball/powerpc | tar -xvzf - -C/usr/local --strip 1`

Then install git and run an update:

  `brew install git`

  `brew update`

Note: The above assumes your /usr/local is setup with the following permissions:

  `drwxrwxr-x  14 root  staff   476B Oct 19 14:35 /usr/local`

And the user you are using has admin access (part of "staff" group).

What Packages Are Available?
----------------------------
1. You can [browse the Formula folder on GitHub][formula].
2. Or type `brew search` for a list.
3. Or run `brew server` to browse packages off of a local web server.

More Documentation
------------------
`brew help` or `man brew` or check our [wiki][].

Who Are You?
------------
I'm [Max Howell][mxcl] and I'm a splendid chap.


[home]:http://mxcl.github.com/homebrew
[wiki]:http://wiki.github.com/mxcl/homebrew
[mxcl]:http://twitter.com/mxcl
[formula]:http://github.com/mxcl/homebrew/tree/master/Library/Formula/
[ppcfork]:http://github.com/sceaga/homebrew/tree/powerpc
