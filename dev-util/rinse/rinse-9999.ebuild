# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Rinse can setup chroot systems running RPM-based distributions."
HOMEPAGE="https://gitorious.org/rinse/rinse"
SRC_URI=""

EGIT_REPO_URI="https://git.gitorious.org/rinse/rinse.git"
if [[ ${PV} == *9999 ]]; then
	KEYWORDS=""
else
	#EGIT_COMMIT="v${PV}" # there are no version tags on gitorious
	KEYWORDS="~amd64"
fi

inherit git-2

LICENSE="|| ( Artistic GPL-1+ )" # see bin/rinse LICENSE (same terms as Perl itself)
SLOT="0"
IUSE=""

DEPEND="
	app-arch/rpm
	dev-lang/perl
"
RDEPEND="${DEPEND}"

src_compile() {
	:
}

src_install() {
	emake PREFIX="${D}" install || die
}
