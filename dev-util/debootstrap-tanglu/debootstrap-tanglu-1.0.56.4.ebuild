# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit versionator
MY_PV="$(replace_version_separator 3 'tanglu')"
MY_PN="debootstrap"

DESCRIPTION="Tanglu bootstrap scripts"
HOMEPAGE=""
SRC_URI="http://archive.tanglu.org/tanglu/pool/main/d/${MY_PN}/${MY_PN}_${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sh ~sparc ~x86 ~amd64-linux ~x86-linux"
IUSE="+keyring"

DEPEND="
	dev-util/debootstrap
	keyring? ( ${CATEGORY}/${PN}-keyring )
"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${P}.tar.gz
	# doh, the folder name inside the tarball mismatches (-tanglu3 vs -tanglu4)
	mv ${WORKDIR}/debootstrap*tanglu* ${S} || die 'failed to rename extracted directory'
	# so let's be bad people and just rename it (until I can figure out a cleaner way to solve this - suggestions very welcome)
}

src_compile() {
	return
}

src_install() {
	insinto /usr/share/debootstrap/scripts
	doins scripts/{aequorea,bartholomea,staging}
}
