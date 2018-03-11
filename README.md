# Traefik

A dynamic reverse proxy for containers.
SSL is automatically configured with [Let's Encrypt](https://letsencrypt.org/).

Access to [/jenkins](http://darenyong.com/jenkins) admin site is IP restricted.

__Special Note:__ Due to [this](https://github.com/containous/traefik/commit/328be161d6e8cd04c1066d5884e4bf35f396b40f)
commit not yet in a release,
Forward-Auth feature in Traefik is not usable since the requested URL is not known.
Therefore a static reverse proxy in front of Traefik is required to achieve something similar.

## Running the container

First, create a empty acme.json file to hold acquired SSL certificates:

> touch acme.json
>
> chmod 600 acme.json

Second, setup a .htpasswd file using the instructions [below](#adminuser)

### <a name="adminuser"></a>Setup admin user for dashboard

__SKIP THIS IF YOU ARE NOT USING WEB DASHBOARD__

On Centos 7, need to install htpassword:

> sudo yum install httpd-tools

Then generate a password file for user 'admin':

> sudo htpasswd -c .htpasswd admin

I keep a password hint in a 'hint' file.

## Deprecated web dashboard

A simple Angular JS web dashboard for traefik can be viewed [here](http://darenyong.com:44444).

__Warning:__ SSL is not enabled for the dashboard and password will go in the clear.
The deprecated dashboard is for demo purpose, disable it in a real deployment.

__Note:__ The web dashbroad is disabled if datadog metrics are enabled.

## Notes

Traefik container must run with --privileged to access docker unix socket.
