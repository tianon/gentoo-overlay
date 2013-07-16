# using this overlay

add `https://raw.github.com/tianon/gentoo-overlay/master/repositories.xml` to files section in /etc/layman/layman.cfg

	layman -f
	layman -a tianon

After performing those steps, the following should work (or any other package from this overlay):

	sudo emerge -av app-emulation/lxc-docker
