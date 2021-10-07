# You can use any base image that can be run on Docker CE 20.10.6 and higher
FROM ubuntu:18.04

# Install libraries

# Copy file that produces submission into root directory
COPY ./inference.sh /

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["/inference.sh"]
