# Docker AWS CLI

A [Docker](https://www.docker.com) image for the AWS Command Line Interface

## Directories
- `/home/user/.aws` This is the AWS configuration directory. Mount this to your local user account to use your AWS configuration
- `/workdir` This is the working directory that is set when tyhe container starts

## User ID control

It is possible to control the UID the initial process runs as. This is important if you are mounting a volumes into the container, as the the UID of the initial process will likely need to match the permissions of the volume to be able to read and/or write to it.

Note: You should **NOT** try to set the UID using Dockers -u or --user option, as this does not ensure that the user actually exists (entry in `/etc/passwd`, home directory, etc).

## Example usage
```bash
docker run \
  -it \
  -v $(pwd):/workdir \
  -v ~/.aws:/home/user/.aws \
  -e LOCAL_USER_ID=$(id -u) \
  --rm \
  aserv92/docker-aws-cli:latest aws --version
```