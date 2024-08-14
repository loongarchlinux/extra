#!/bin/bash

#
# Helper script which prints ejabberd deps' urls including commit hash
#

test -d src/ejabberd-*/config || makepkg -od || exit 1

cd src/ejabberd-*/config && cd ..

grep -oP 'git, "https://.+", ' rebar.config | cut -f2 -d'"' | sort -u | while read U; do
	N=`basename $U`
	echo -e "\t\"$N::$U\""
done | sed 's|https://|git+https://|' >../../PKGBUILD.inc
