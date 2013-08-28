# using this overlay

Add `https://raw.github.com/tianon/gentoo-overlay/master/repositories.xml` to overlays section in `/etc/layman/layman.cfg` (as per instructions on the [Gentoo Wiki](http://wiki.gentoo.org/wiki/Layman#Adding_custom_overlays)), then invoke the following:

	layman -f -a tianon

After performing those steps, the following should work (or any other package from this overlay):

	sudo emerge -av app-emulation/tilem

# here for app-emulation/lxc-docker?

The `app-emulation/lxc-docker` (and companion `app-emulation/lxc-docker-bin`) package has moved to its [own repository](https://github.com/tianon/docker-overlay).  For your convenience, that repository has been added to the repositories.xml file here so that you can simply invoke the following to keep up:

	layman -f -a docker
	layman -d tianon # optional, but you no longer need my personal overlay

If you'd like to modify your `layman.cfg` to point to the docker-overlay `repositories.xml` file directly instead of mine, use something similar to the following:

	sed -i 's!/tianon/gentoo-overlay/!/tianon/docker-overlay/!' /etc/layman/layman.cfg
