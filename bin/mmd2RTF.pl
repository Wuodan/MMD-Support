#!/bin/sh
#
# mmd2RTF --- MultiMarkdown convenience script
#	<http://fletcherpenney.net/multimarkdown/>
#	Copyright (c) 2010-2011 Fletcher T. Penney
#
# Pass arguments on to the binary to convert text to RTF
#	using the textutil program included with Mac OS X
#
#	Will not work on Windows or *nix
#

# Be sure to include multimarkdown in our PATH
export PATH="/usr/local/bin:$PATH"

if [ $# = 0 ]
then
	# No arguments, so use stdin/stdout
	multimarkdown | textutil -convert rtf -stdin -stdout 
else
until [ "$*" = "" ]
do
	# process each argument separately
	file_name=`echo "$1"| sed 's/\.[^.]*$//'`
	multimarkdown "$1" | textutil -convert rtf -stdin -stdout > "$file_name.rtf"
	shift
done
fi
