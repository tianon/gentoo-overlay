# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils

DESCRIPTION="Rinse is a simple tool which is designed to carry out the installation of a new RPM-based distribution."
HOMEPAGE="https://collab-maint.alioth.debian.org/rinse/"
SRC_URI="mirror://debian/pool/main/${PN:0:1}/${PN}/${PN}_${PV}.tar.xz"

LICENSE="|| ( Artistic GPL-1+ )" # see bin/rinse LICENSE (same terms as Perl itself)
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	app-arch/rpm
	dev-lang/perl
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

src_compile() {
	sed -i 's/ --extract-over-symlinks / /g' bin/rinse
}

src_install() {
	emake PREFIX="${D}" install || die
}
