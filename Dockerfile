FROM ruby

RUN gem install showoff

ENTRYPOINT ["showoff"]
CMD ["help"]
