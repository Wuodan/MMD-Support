#!/bin/sh

# convert XHTML to LaTeX using XSLT

if [ $# == 0 ]
then
	# No arguments, so use stdin/stdout
	
	# Need a temporary file
	file_name=`mktemp`
	
	cat > $file_name
	
	# Determine which stylesheet to use
	mode=`/usr/local/bin/multimarkdown -e latexmode "$file_name"`
	
	if [ "$mode" = "memoir" ]
	then
		# Use memoir
		/usr/local/bin/multimarkdown "$file_name" | xsltproc -nonet -novalid /Users/fletcher/Documents/Dropbox/Active/peg-multimarkdown/Support/XSLT/memoir.xslt -
		shift
	else
		# Use default latex
		/usr/local/bin/multimarkdown "$file_name" | xsltproc -nonet -novalid /Users/fletcher/Documents/Dropbox/Active/peg-multimarkdown/Support/XSLT/xhtml2latex.xslt -
		shift
	fi

else
until [ "$*" = "" ]
do
	# process each argument separately
	file_name=`echo $1|cut -d. -f1 `
	
	# Determine which stylesheet to use
	mode=`/usr/local/bin/multimarkdown -e latexmode "$1"`
	
	if [ "$mode" = "memoir" ]
	then
		# Use memoir
		/usr/local/bin/multimarkdown "$1" | xsltproc -nonet -novalid /Users/fletcher/Documents/Dropbox/Active/peg-multimarkdown/Support/XSLT/memoir.xslt -  > "$file_name.tex"
		shift
	else
		# Use default latex
		/usr/local/bin/multimarkdown "$1" | xsltproc -nonet -novalid /Users/fletcher/Documents/Dropbox/Active/peg-multimarkdown/Support/XSLT/xhtml2latex.xslt -  > "$file_name.tex"
		shift
	fi
done
fi


