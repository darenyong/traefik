# Traefik

A dynamic reverse proxy for containers.
SSL is automatically configured using
[Let's Encrypt](https://letsencrypt.org/).

Access to the [/jenkins](http://darenyong.com/jenkins) admin site is
IP restricted.

__Special Note:__ Due to
[this](https://github.com/containous/traefik/commit/328be161d6e8cd04c1066d5884e4bf35f396b40f)
commit not yet in a release, Traefik had to be built from source code.

## Building Traefik from source

First install the GO dev environment following the instructions
[here](https://www.digitalocean.com/community/tutorials/how-to-install-go-1-7-on-centos-7).

Next, temporarily disable SELinux on CentOS 7
(otherwise docker volumes may get permission errors)

> sudo setenforce 0

Clone the Traefik source code to /tmp

> cd /tmp
>
> git clone https://github.com/containous/traefik

Next create the latest docker image for Traefik using make:

> cd /tmp/traefik
>
> make image

## Running the container

Make sure you are inside this repo

> cd /home/yourname/src/traefik

First, create a empty acme.json file to hold acquired SSL certificates:

> touch acme.json
>
> chmod 600 acme.json

Second, setup a .htpasswd file using the instructions [below](#adminuser)

### <a name="adminuser"></a>Setup admin user for dashboard

__SKIP THIS__ if you are not using the web dashboard.

On Centos 7, install htpassword:

> sudo yum install httpd-tools

Then generate a password file for user 'admin':

> sudo htpasswd -c .htpasswd admin

I keep a password hint in a separate 'hint' file.

### Start the Traefik container

> ./run.sh

## Traefik web dashboard

A simple Angular JS web dashboard for traefik can be viewed [here](http://darenyong.com:44444).

__Warning:__ SSL is not enabled for the dashboard and admin password will go
in the clear. The deprecated dashboard is for demo purposes,
replace with Prometheus/Grafana in prod.

__Note:__ The web dashboard is disabled if metrics are enabled.

## Notes

Traefik container must run with --privileged to access docker unix socket.

## Hardening

* Investigate XSS (Http-Only, CSP policies) [guide](https://excess-xss.com/)
* Investigate methods for anti-CSRF [discussion](https://security.stackexchange.com/questions/177300/what-happens-if-my-anti-csrf-token-is-compromised-by-an-xss-attack?rq=1)