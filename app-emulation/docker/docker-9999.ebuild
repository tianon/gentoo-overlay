# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Docker complements LXC with a high-level API which operates at the process level. It runs unix processes with strong guarantees of isolation and repeatability across servers."
HOMEPAGE="http://www.docker.io/"
SRC_URI=""

EGIT_REPO_URI="git://github.com/dotcloud/docker.git"
if [[ ${PV} == *9999 ]]; then
	KEYWORDS=""
else
	EGIT_COMMIT="v${PV}"
	KEYWORDS="~amd64"
fi

inherit git-2

LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

DEPEND="
	dev-lang/go
"
RDEPEND="
	app-arch/libarchive
	app-emulation/lxc
	net-firewall/iptables
	net-misc/bridge-utils
	net-misc/curl
	sys-apps/iproute2
"

src_install() {
	dobin bin/docker
	dodoc README.md
	[[ ${PV} == *9999 ]] && dodoc CONTRIBUTING.md
}

pkg_postinst() {
	ewarn "Docker currently assumes a network bridge named lxcbr0 exists and is usable."
	ewarn "See https://github.com/dotcloud/docker/issues/219 for more details."
}
