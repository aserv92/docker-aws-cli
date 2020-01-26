# Docker image for the AWS Command Line Interface

A [Docker](https://www.docker.com) image for the AWS Command Line Interface

To use the container with a project, do the following:

  * Copy the bin directory into your project.

  * Ensure that your profile PATH includes `./bin` and that it takes priority over any other directory that may include a aws executable:

        PATH=./bin:$PATH

Now whenever you are in your project's directory, you can simply execute `aws` and the command will execute in the container instead.

# User ID control

It is possible to control what UID the initial process. The `/usr/bin/aws` file already does this for the initial process.

This is important if you are mounting a volumes into the container, as the the UID of the initial process will likely need to match the volume to be able to read and/or write to it.

Note: You should _NOT_ try to set the UID using Dockers -u or --user option, as this does not ensure that the user actually exists (entry in `/etc/passwd` home directory etc).

Based on https://github.com/Chekote/docker-ubuntu
