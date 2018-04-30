FROM drecom/ubuntu-ruby:latest

RUN gem install showoff

ENTRYPOINT ["/bin/showoff"]
CMD ["help"]
