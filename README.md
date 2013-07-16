# using this overlay

Add `https://raw.github.com/tianon/gentoo-overlay/master/repositories.xml` to overlays section in /etc/layman/layman.cfg (as per instructions on the [Gentoo Wiki](http://wiki.gentoo.org/wiki/Layman#Adding_custom_overlays)), then invoke the following:

	layman -f -a tianon

After performing those steps, the following should work (or any other package from this overlay):

	sudo emerge -av app-emulation/lxc-docker
