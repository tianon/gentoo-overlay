# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Docker complements LXC with a high-level API which operates at the process level. It runs unix processes with strong guarantees of isolation and repeatability across servers."
HOMEPAGE="http://www.docker.io/"
SRC_URI="http://get.docker.io/builds/Linux/x86_64/docker-v${PV}.tgz"
KEYWORDS="-* ~amd64 ~x86"

inherit linux-info systemd

LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="
	!app-emulation/lxc-docker
	app-arch/libarchive
	app-emulation/lxc
	net-firewall/iptables
	sys-apps/iproute2
	|| (
		sys-fs/aufs3
		sys-kernel/aufs-sources
	)
"

RESTRICT="strip"

S="${WORKDIR}/docker-v${PV}"

pkg_setup() {
	CONFIG_CHECK+=" ~NETFILTER_XT_MATCH_ADDRTYPE"
	check_extra_config
}

src_install() {
	dobin docker
	
	newinitd "${FILESDIR}/docker.initd" docker
	
	systemd_dounit "${FILESDIR}/docker.service"
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
