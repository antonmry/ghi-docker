FROM fedora
MAINTAINER Antón R. Yuste

# Updating dependencies, installing Apache and cleaning dnf caches to reduce container size
RUN dnf -y update
RUN dnf -y install ruby-devel git make gcc redhat-rpm-config which
RUN dnf clean all

# See https://github.com/stephencelis/ghi/blob/master/README.md#install
RUN gem install ghi --no-rdoc --no-ri

# User ghi instead of root
RUN useradd -ms /bin/bash ghi
USER ghi
WORKDIR /home/ghi
VOLUME /home/ghi

ENTRYPOINT ["/usr/local/bin/ghi"]
