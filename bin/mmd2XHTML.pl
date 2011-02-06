#!/bin/sh
#
# mmd --- MultiMarkdown convenience script
#	<http://fletcherpenney.net/multimarkdown/>
#	Fletcher T. Penney
#
# Pass arguments on to the binary to convert text to XHTML
#

if [ $# == 0 ]
then
	multimarkdown
else
until [ "$*" = "" ]
do
	multimarkdown -b "$1"
	shift
done
fi
