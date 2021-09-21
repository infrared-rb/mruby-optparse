# mruby-optparse

This is the forked version of `fastly/mruby-optparse`.

Differences are:

* This optparse uses [posix (or GNU extended) regexp](https://github.com/udzura/mruby-posix-regexp) instead of onigmo dependency
* For that reason, some of features of original optparse are unsupported

---

This is a port of OptionParser from CRuby.

See [the CRuby OptionParser
documentation](http://docs.ruby-lang.org/en/2.3.0/OptionParser.html) for usage
documentation.  All base features of CRuby OptionParser class should work
except using the ARGV extensions.  The additional acceptables you can require
in CRuby (ac, shellwords, uri, date, time, version) are not included.

This port of OptionParser provides OptionParser#record_separator as mruby does
not provide `$/`.

See [optparse.rb.diff](optparse.rb.diff) for the diff from CRuby's optparse
(from Ruby 2.3.1-ish) to this port.

## License

Copyright (C) Yukihiro Matsumoto. All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:
1. Redistributions of source code must retain the above copyright
notice, this list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright
notice, this list of conditions and the following disclaimer in the
documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
SUCH DAMAGE.
