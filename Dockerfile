FROM ruby:2.7.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
WORKDIR /P4
COPY Gemfile /P4/Gemfile
RUN bundle install
#ADD . /P4

COPY docker-entrypoint.sh /P4/

ENTRYPOINT ["/P4/docker-entrypoint.sh"]


# Set defaults to run the image
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
