# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Got Your Back is a tool for backing up Gmail messages to your computer."
HOMEPAGE="https://code.google.com/p/got-your-back/"
SRC_URI=""

ESVN_REPO_URI_BASE="http://got-your-back.googlecode.com/svn"
if [[ ${PV} == *9999 ]]; then
	ESVN_REPO_URI="${ESVN_REPO_URI_BASE}/trunk"
	KEYWORDS=""
else
	ESVN_REPO_URI="${ESVN_REPO_URI_BASE}/tags/Alpha-${PV}"
	KEYWORDS="~amd64"
fi

PYTHON_DEPEND="2"
PYTHON_USE_WITH="sqlite"

inherit subversion python

LICENSE=""
SLOT="0"
IUSE=""

DEPEND="
"
RDEPEND="
	${DEPEND}
	dev-python/gdata
"

src_prepare() {
	epatch "${FILESDIR}"/*.patch
	
	python_convert_shebangs $(python_get_version) *.py
}

src_install() {
	exeinto "$(python_get_sitedir)"/${PN}
	doexe *.py || die
	
	dosym "$(python_get_sitedir)"/${PN}/gyb.py /usr/bin/gyb || die
}
