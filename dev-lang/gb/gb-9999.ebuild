# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="gb, the project based build tool for Go"
HOMEPAGE="https://getgb.io"
SRC_URI=""

inherit eutils

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	EGIT_REPO_URI="git://github.com/constabulary/${PN}.git"
	inherit git-2
else
	MY_PV="${PV/_/-}"
	MY_P="${PN}-${MY_PV}"
	SRC_URI="https://github.com/constabulary/${PN}/archive/v${MY_PV}.tar.gz -> ${MY_P}.tar.gz"
	S="${WORKDIR}/${MY_P}"
	KEYWORDS="~amd64"
fi

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=">=dev-lang/go-1.4:="
RDEPEND="dev-vcs/git"

src_prepare() {
	epatch_user
}

src_compile() {
	export GOPATH="${T}/gopath"
	mkdir -pv "$GOPATH/src/github.com/constabulary" || die
	ln -svT "${S}" "$GOPATH/src/github.com/constabulary/${PN}" || die
	cd "$GOPATH/src/github.com/constabulary/${PN}" || die
	go install -v ./... || die
}

src_install() {
	dobin "${T}/gopath/bin/"*
}
