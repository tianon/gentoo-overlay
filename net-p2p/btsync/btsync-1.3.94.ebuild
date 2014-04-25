# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="BitTorrent Sync allows you to syncronize directories"
HOMEPAGE="http://www.bittorrent.com/sync"
SRC_URI="amd64? ( http://download-lb.utorrent.com/endpoint/btsync/os/linux-x64/track/stable -> ${P}.tar.gz )"

RESTRICT="mirror"

LICENSE="BitTorrent"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"

QA_PREBUILT="usr/bin/btsync"

src_compile() {
	VERSION="$(./btsync --help | head -n1 | cut -d' ' -f3)"
	[ "$VERSION" = "$PV" ] || die "version mismatch! (expected $PV, got $VERSION)"
	./btsync --dump-sample-config > btsync.conf || die './btsync --dump-sample-config failed'
}

src_install() {
	dodoc LICENSE.TXT
	dobin btsync

	insinto /etc
	doins btsync.conf

	newinitd "${FILESDIR}/btsync.initd" btsync
	newconfd "${FILESDIR}/btsync.confd" btsync
}
