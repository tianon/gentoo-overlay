# using this overlay

	git clone git://github.com/tianon/gentoo-overlay.git tianon-overlay
	echo "PORTDIR_OVERLAY=\"\${PORTDIR_OVERLAY} $(cd tianon-overlay && pwd -P)\"" | sudo tee -a /etc/portage/make.conf

After performing those steps, the following should work (or any other package from this overlay):

	sudo emerge -av app-emulation/lxc-docker
