FROM: maven:3.6.3-openjdk-11

COPY scripts/*.sh /tmp/scripts/

RUN /tmp/scripts/installer.sh
