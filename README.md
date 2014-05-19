#puppet-dokuwiki

####Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
    * [What dokuwiki affects](#what-dokuwiki-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with dokuwiki](#beginning-with-dokuwiki)
4. [Usage](#usage)
5. [Limitations](#limitations)
6. [TODOs](#TODOs)

##Overview

This small dokuwiki module installs dokuwiki.

You need to create a apache vhost like:

```yaml
apache::vhost:
  "dokuwiki.example.com":
    servername: "dokuwiki.example.com"
    port: 80
    docroot: /var/www/dokuwiki
    directories:
      - path: /var/www/dokuwiki
        options:
          - FollowSymLinks
        allow_override: All

```

Written for Puppet >= 3.4.0.

##Module Description

See [Overview](#overview) for now.

##Setup

###What dokuwiki affects

* dokuwiki :-) 

###Setup Requirements

None yet.
	
###Beginning with dokuwiki	

Simply include it to install dokuwiki.

##Usage

Just include the module by
```puppet
include dokuwiki
```
to get the stable version.

##Limitations:

Debian like systems. 
Tested on:

* Debian 7

Puppet Version >= 3.4.0, due to specific hiera usage.

##TODOs:

* make it work with puppet pre 3.4 
* make it work wit Redhat like systems
* check ../VERSION for Version to install

