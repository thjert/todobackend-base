FROM ubuntu:trusty
MAINTAINER Thomas Hjert <thomas.hjert@knowit.se>

ENV TERM=xterm-256color

#Set mirrors to SE

RUN sed -i "s/http:\/\/archive./http:\/\/se.archive./g" /etc/apt/sources.list

# Install Phython runtime

RUN apt-get update && \
    apt-get install -y \
    -o APT::Install-Recommend=false -o APT::Install-Suggests=false \
    python python-virtualenv libpython2.7 python-mysqldb

# Create virtual environment

RUN virtualenv /appenv && \
    . /appenv/bin/activate && \
    pip install pip --upgrade


# Add entrypoint script
ADD scripts/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

LABEL application=todobackend
