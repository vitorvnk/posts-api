FROM ruby:3.0.5-alpine

RUN apk update && \
    apk add --no-cache \
        build-base \
        postgresql-dev \
        tzdata \
        nodejs \
        yarn

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

RUN bundle install
# RUN rails db:create
# RUN rails db:migrate

CMD ["rails", "server", "-b", "0.0.0.0"]


