# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

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

inherit git-2 linux-info

LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

DEPEND="
	dev-lang/go
"
RDEPEND="
	!app-emulation/docker-bin
	app-arch/libarchive
	app-emulation/lxc
	net-firewall/iptables
	sys-apps/iproute2
	|| (
		sys-fs/aufs3
		sys-kernel/aufs-sources
	)
"

pkg_setup() {
	CONFIG_CHECK+=" ~NETFILTER_XT_MATCH_ADDRTYPE"
	check_extra_config
}

src_compile() {
	emake VERBOSE=1
}

src_install() {
	dobin bin/docker
	dodoc AUTHORS CONTRIBUTING.md NOTICE README.md
	
	newinitd "${FILESDIR}/docker.initd" docker
	
	insinto /usr/share/${P}/contrib
	doins contrib/{README,mkimage-busybox.sh}
	cp -R "${S}/contrib"/{docker-build,vagrant-docker} "${D}/usr/share/${P}/contrib/"
}

pkg_postinst() {
	elog "To use docker, the docker daemon must be running as root. To automatically"
	elog "start the docker daemon at boot, add docker to the default runlevel:"
	elog "  rc-update add docker default"
	
	ewarn "If you want your containers to have access to the public internet or even"
	ewarn "the existing private network, IP Forwarding must be enabled:"
	ewarn "  sysctl -w net.ipv4.ip_forward=1"
	ewarn "or more permanently:"
	ewarn "  echo net.ipv4.ip_forward = 1 > /etc/sysctl.d/${PN}.conf"
	ewarn "Please be mindful of the security implications of enabling IP Forwarding."
}
