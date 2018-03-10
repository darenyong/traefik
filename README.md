# Traefik

A dynamic reverse proxy for Docker containers.
SSL is automatically configured with [Let's Encrypt](https://letsencrypt.org/)

Access to [/jenkins](http://darenyong.com/jenkins) admin site is IP restricted

# Deprecated web dashboard

A simple Angular JS web dashboard for traefik can be viewed [here](http://darenyong.com:44444)

__Warning:__ SSL is not enabled for the dashboard and password will go in the clear.
The deprecated dashboard is for demo purpose, disable it in a real deployment.

# Setup admin user for dashboard

On Centos 7, need to install htpassword

> sudo yum install httpd-tools

Then generate a password file for user 'admin'

> sudo htpasswd -c .htpasswd admin

I keep a password hint in a 'hint' file.

# Notes

Traefik container must run with --privileged to access docker unix socket