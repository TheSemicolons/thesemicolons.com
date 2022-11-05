#
# Copyright (c) 2022 James Anderson <thesemicolons@protonmail.com>
#
# Permission to use, copy, modify, and distribute this software for any purpose
# with or without fee is hereby granted, provided that the above copyright
# notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
# REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
# LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
# PERFORMANCE OF THIS SOFTWARE.
#

.POSIX:
.SUFFIXES:

VERSION   = 0.1

all: public

install: public
	openrsync -av --delete public/ web0.thesemicolons.com:/home/www/htdocs/thesemicolons.com

public:
	hugo
	find public -type f -exec gzip -fk {} \;

clean:
	rm -Rf public resources
