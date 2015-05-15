# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/debootstrap/debootstrap-1.0.67.ebuild,v 1.11 2015/02/28 13:23:30 ago Exp $

EAPI=5
inherit eutils

DESCRIPTION="Debian/Ubuntu bootstrap scripts"
HOMEPAGE="http://packages.qa.debian.org/d/debootstrap.html"
SRC_URI="mirror://gentoo/devices.tar.gz"
EGIT_REPO_URI="git://anonscm.debian.org/d-i/debootstrap.git"
inherit git-r3

LICENSE="MIT"
SLOT="0"

RDEPEND="
	app-arch/dpkg
	net-misc/wget
	sys-devel/binutils
"

DOCS=( TODO debian/changelog )

src_unpack() {
	git-r3_src_unpack
	cp "${DISTDIR}"/devices.tar.gz "${S}"
}

src_compile() {
	return
}

src_install() {
	default
	doman debootstrap.8
}

pkg_postinst() {
	if ! has_version ${CATEGORY}/${PN} && ! has_version app-crypt/gnupg; then
		elog "To check Release files against a keyring"
		elog " (--keyring=K), please install app-crypt/gnupg."
	fi
}