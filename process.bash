#!/usr/bin/env bash

set -e

cd /tmp

jobname=`uuidgen`

cat /dev/fd/0>/tmp/$jobname.latex

if pdflatex --interaction=nonstopmode /tmp/$jobname.latex >/tmp/1 2>/tmp/2; then
	pdflatex --interaction=nonstopmode /tmp/$jobname.latex &>/dev/null
	cat /tmp/$jobname.pdf
	exit 0
else
	cat /tmp/1
	>&2 cat /tmp/2
	exit 1
fi
