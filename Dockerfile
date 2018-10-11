FROM drecom/ubuntu-ruby:latest

RUN apt-get update && \
    apt-get upgrade -y

RUN gem install showoff --no-ri --no-rdoc

RUN mkdir /srv/showoff
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/log/*log /var/log/apt/* /var/lib/dpkg/*-old /var/cache/debconf/*-old
WORKDIR /srv/showoff

ENTRYPOINT ["/usr/local/rbenv/shims/showoff"]
CMD ["help"]