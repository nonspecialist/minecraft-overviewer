# Minecraft overviewer

## Setup

Create an ec2 instance from the ubuntu baseline
Run `baseline.sh` on it as root
Run `creds.sh` (gitignored because credentials) on it as root
copy `overviewer.conf` to /persistent/overviewer

Open `screen` as root
Run `mainloop.sh` in screen (yep, as root).

## Wait, what?

This is totally hacked together.

Things I'd like to be able to do in future:

 * Not run as root
 * Run as a service / cronjob / something other than a while loop.
 * Run on the same host as our minecraft instance
