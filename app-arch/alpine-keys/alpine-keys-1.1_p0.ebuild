# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

MY_PV="${PV/_p/-r}"

DESCRIPTION="Public keys for Alpine Linux packages"
HOMEPAGE="https://pkgs.alpinelinux.org/package/main/x86_64/alpine-keys"
SRC_URI="http://dl-4.alpinelinux.org/alpine/edge/main/x86_64/${PN}-${MY_PV}.apk -> ${PN}-${MY_PV}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_install() {
	insinto /etc/apk/keys
	doins etc/apk/keys/*
}
