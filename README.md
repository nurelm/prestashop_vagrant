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

Now grab copy of the Vagrant box that we'll use.  You'll only have to do this once, and it will grab an image of Ubuntu 14.04 for you to use anytime it pleases you. It will ask you what environment you're using, pick the option for VirtualBox.

    vagrant box add bento/ubuntu-14.04

Now fire up the vagrant. The next two words will start up the box you just downloaded and run the commands in bootstrap.sh within that box, which will grab and setup everything you need to run PrestaShop on that vagrant:

    vagrant up

You may want to go have some coffee or maybe take a shower, as this will take a few minutes while it's loading and installing various packages.

When that's all done, got to [this page](http://localhost:8081/prestashop/install) and go through the setup. You'll eventually be asked for the database name, user and password.  The database is 'prestashop', user is 'root' and password is 'abc123'.

Once you're done, it'll ask you to remove the install folder.  Do do that, SSH into your vagrant and remove that folder:

    vagrant ssh
    rm -rf /var/www/html/prestashop/install/

## Basic Usage
Just fire up the browser of your choice and take a peek at http://localhost:8081/prestashop. If you want to check out the database, we installed phpMyAdmin, too, so just hit http://localhost:8081/phpmyadmin and use the same root/abc123 to log in.

## Advanced Usage
To expose your local prestashop to the internet, you can use ngrok.com where signing up is free and gets you access to custom subdomains. So you can run something like `./ngrok -subdomain psMyFirstName 8081` after `vagrant up` which will tunnel and connect your local server to the internet. This means it will let your teammates reach your server publically at http://psMyFirstName.ngrok.com/prestashop

## Development
Back in your host operating system, notice that there is a new directory in the same directory as this README file called "prestashop".  This is the very same directory that your new vagrant sees, and any edits made from either within the vagrant or from your host operating system will be seen in both places. This means you can edit using any tools in your host OS that you please!

It's easy to tinker with exactly what gets installed, just edit the bootstrap.sh file.

## Further Documentation
- http://docs.vagrantup.com/v2/getting-started/index.html
- https://www.virtualbox.org/wiki/End-user_documentation

## Credits
Tweet a shout out @nurelm to your friendly Prestashop partners at [NuRelm](http://www.nurelm.com) if this helped you out.
