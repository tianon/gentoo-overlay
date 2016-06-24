# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

EGO_SRC="github.com/constabulary/${PN}"
EGO_PN="${EGO_SRC}/..."

if [[ ${PV} = *9999* ]]; then
	inherit golang-vcs
else
	KEYWORDS="~amd64"
	EGIT_COMMIT=v${PV}
	SRC_URI="https://${EGO_SRC}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
	inherit golang-vcs-snapshot
fi
inherit golang-build

DESCRIPTION="A project based build tool for Go"
HOMEPAGE="https://getgb.io"
LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

DEPEND="dev-go/errors"
RDEPEND=""

src_prepare() {
	epatch_user
}

src_install() {
	golang-build_src_install
	dobin bin/*
}
