# PrestaShop Quickstart Vagrant

## Overview
[PrestaShop](http://www.prestashop.com/) is a popular PHP-based [open source e-commerce platform](https://github.com/PrestaShop/PrestaShop).

Developing PrestaShop (and lots of other things) inside a [Vagrant](http://www.vagrantup.com) is nice in a lot of situations:

- Maybe you like to keep a tidy workstation and not install a bunch of junk in your OS that you know you will probably never remove.
- Maybe you are developing on a Windows machine that does not play well with many of the tools you need.
- Or maybe you like the [Vagrant Cloud](https://vagrantcloud.com/) ability to share an application you built on your dev Vagrant with anybody, even outside of your network.
- Perhaps you love the idea of developing and experimenting with wild abandon, knowing that you can blow up and recreate your dev environment at any time, on any machine.
- Or you are working in a team and do not relish the idea of spending an hour with every developer, every week, making sure you have the same dev environment.

Using nothing but [VirtualBox](http://www.virtualbox.org), [Vagrant](http://www.vagrantup.com) and
the 2 humble files in this repository, a nice isolated PrestaShop development environment can be all yours.

## Installation
First, download and install [VirtualBox](http://www.virtualbox.org) and [Vagrant](http://www.vagrantup.com).

Then open up a terminal window and `cd` into the directory containing this README and the files Vagrantfile and bootstrap.sh:

    cd directory_containing_vagrantfile

Now grab copy of the Vagrant box that we'll use.  You'll only have to do this once, and it will grab an image of Ubuntu 13.04 for you to use anytime it pleases you. It will ask you what environment you're using, pick the option for VirtualBox.

    vagrant box add chef/ubuntu-13.04

Now fire up the vagrant. The next two words will start up the box you just downloaded and run the commands in bootstrap.sh within that box, which will grab and setup everything you need to run PrestaShop on that vagrant:

    vagrant up

You may want to go have some coffee or maybe take a shower, as this will take a few minutes while it's loading and installing various packages.

When that's all done, got to [this page](http://localhost:8081/prestashop) and go through the setup. You'll eventually be asked for the database name, user and password.  The database is 'prestashop', user is 'root' and password is 'abc123'.

Once you're done, it'll ask you to remove the install folder.  Do do that, SSH into your vagrant and remove that folder:

    vagrant ssh
    rm -rf /var/www/prestashop/install

## Coming Soon ...
We'll put PrestaShop in a directory that's accessible to your host OS so you can hack on it.

## Further Documentation
- https://github.com/spree/spree
- http://docs.vagrantup.com/v2/getting-started/index.html
- https://www.virtualbox.org/wiki/End-user_documentation

## Credits
Tweet a shout out @nurelm to your friendly PrestaShop partners at [NuRelm](http://www.nurelm.com) if this helped you out.
