# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Tanglu bootstrap scripts"
HOMEPAGE=""
SRC_URI="" # ... so, valve is kind of silly, and their "debootstrap" package is worthless (ie, the script inside is just a symlink: no default_mirror, no keyring, etc)

LICENSE=""
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sh ~sparc ~x86 ~amd64-linux ~x86-linux"
IUSE="+keyring"

DEPEND="
	dev-util/debootstrap
	keyring? ( ${CATEGORY}/${PN}-keyring )
"
RDEPEND="${DEPEND}"

S="${WORKDIR}" # just because we have no files, so we have no directory

src_compile() {
	return
}

src_install() {
	insinto /usr/share/debootstrap/scripts
	doins ${FILESDIR}/*
}
