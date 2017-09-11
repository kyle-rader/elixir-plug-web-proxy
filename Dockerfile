# Start with Elixir latest image
FROM elixir:latest

# Make app directory
LABEL authors="Kyle Rader <kyle@kylerader.ninja>"

# Update image
RUN apt-get install -qq -y --no-install-recommends \
      git

RUN apt-get install -qq -y --no-install-recommends \
      curl libpq-dev

# Make app directory
ENV INSTALL_PATH /app_root
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

# Copy all our app's directories
COPY ./lib ./lib
COPY ./config ./config
COPY ./mix* ./

# Install deps
RUN mix local.hex --force
RUN mix deps.get

EXPOSE 80

CMD ["mix", "run", "--no-halt"]
