# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Got Your Back (GYB) is a command line tool for backing up your Gmail messages to your local computer."
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

inherit subversion python

LICENSE=""
SLOT="0"
IUSE=""

DEPEND="
"
RDEPEND="
	${DEPEND}
	dev-lang/python[sqlite]
	dev-python/gdata
"

pkg_setup() {
	python_set_active_version 2
	python_pkg_setup
}

src_prepare() {
	epatch "${FILESDIR}"/*.patch
	
	python_convert_shebangs $(python_get_version) *.py
}

src_install() {
	exeinto "$(python_get_sitedir)"/${PN}
	doexe *.py || die
	
	dosym "$(python_get_sitedir)"/${PN}/gyb.py /usr/bin/gyb || die
}
