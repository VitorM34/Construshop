FROM ruby:3.4.3

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y \
    lsb-base \
    lsb-release \
    wget \
    curl \
    gnupg2 \
    build-essential \
    libpq-dev \
    vim \
    htop \
    nodejs \
    npm

RUN curl https://www.postgresql.org/media/keys/ACCC4CF8.asc | gpg --dearmor -o /usr/share/keyrings/postgresql-archive-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/postgresql-archive-keyring.gpg] https://apt.postgresql.org/pub/repos/apt bookworm-pgdg main" > /etc/apt/sources.list.d/pgdg.list && \
    apt-get update && apt-get install -y postgresql-client-16

RUN gem install pg


WORKDIR /home/app/web

COPY . .

RUN npm install

RUN bundle install --jobs 5 --retry 5


EXPOSE 3000

CMD ["bin/rails", "server", "-b", "0.0.0.0"]