FROM drecom/ubuntu-ruby:latest

RUN gem install showoff
RUN mkdir /srv/showoff
WORKDIR /srv/showoff

ENTRYPOINT ["/usr/local/rbenv/shims/showoff"]
CMD ["help"]
