FROM elixir:latest


ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

RUN apt-get update && \
    apt-get install -y postgresql-client inotify-tools elixir npm && \ 
    npm install alpinejs && \
    apt-get install -y nodejs && \
    mix local.hex && \
    mix archive.install hex phx_new --force && \
    mix local.rebar --force

CMD ["mix", "phx.server"]
