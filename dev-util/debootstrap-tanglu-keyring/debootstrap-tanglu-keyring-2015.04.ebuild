# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MY_PN="tanglu-archive-keyring"

DESCRIPTION="GnuPG archive keys of the Debian archive"
HOMEPAGE=""
SRC_URI="http://archive.tanglu.org/tanglu/pool/main/t/${MY_PN}/${MY_PN}_${PV}_all.deb"

inherit unpacker

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sh ~sparc ~x86 ~amd64-linux ~x86-linux"
IUSE=""

DEPEND="app-crypt/gnupg"
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_install() {
	cp -R * "${D}/"
}
