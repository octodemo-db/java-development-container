FROM maven:3.6.3-openjdk-11

ARG image_url=https://github.com/octodemo-db/java-development-container
ARG version=1
ARG revision=unknown

# TODO support injection of versions of tools, Google Cloud SDK, Terraform/Terragrunt

COPY scripts/*.sh /tmp/scripts/
RUN apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
    && /bin/bash /tmp/scripts/installer.sh \
    && /bin/bash /tmp/scripts/google-cloud-sdk.sh \
    && /bin/bash /tmp/scripts/terraform.sh \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/* /tmp/scripts

LABEL \
    org.opencontainers.image.authors GitHub Solutions Engineering \
    org.opencontainers.image.url $image_url \
    org.opencontainers.image.documentation $image_url/README.md \
    org.opencontainers.image.source $image_url \
    org.opencontainers.image.version $version \
    org.opencontainers.image.revision $revision \
    org.opencontainers.image.vendor GitHub \
    org.opencontainers.image.licenses MIT \
    org.opencontainers.image.title GitHub Solutions Engineering Bookstore Development Tools Container \
    org.opencontainers.image.description Container for Java development tools for the bookstore

# USER vscode
