FROM elixir:1.5.3-alpine

RUN mix local.hex --force

RUN mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez --force

RUN mkdir /app  
COPY . /app  
WORKDIR /app

RUN mix deps.get
CMD mix do ecto.create, ecto.migrate, phx.server