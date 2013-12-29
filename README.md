Streams Login Script
====================

To make use of the command line tools shipped with [IBM's InfoSphere Streams](http://www.ibm.com/software/products/en/infosphere-streams/), each user must set up their environment to use IBM's version of Java and update their path to point to the location of the Streams installation. The [installation documentation](http://pic.dhe.ibm.com/infocenter/streams/v3r2/topic/com.ibm.swg.im.infosphere.streams.cfg.doc/doc/ibminfospherestreams-configuring-streams-environment.html) explains how to set up the environment for Streams and suggests that it is done on a per-user basis in their ~/.bashrc file, or on a per-node basis as a /etc/profile.d script.

streams.sh in this repo is a script that is intended to be copied into /etc/profile.d that will:

1. Set up each user's environment so that they can use the Streams command line tools
1. Automatically generate a Streams key if they don't already have one
1. To make it easier for admins to give a new user access to shared Streams instance(s), it will also:
    2. E-mail admins to let them know a new user has been set up
    2. Copy their public Streams key to somewhere admins can access
