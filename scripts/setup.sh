#!/bin/bash

cat ~/.bashrc
source ~/.bashrc

asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git 
asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git 
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git 
KERL_CONFIGURE_OPTIONS=--without-javac KERL_BUILD_DOCS=yes asdf install erlang 24.0.4
asdf install elixir 1.12.2-otp-24
asdf install nodejs 14.15.1
asdf global erlang 24.0.4
asdf global elixir 1.12.2-otp-24
asdf global nodejs 14.15.1
asdf reshim erlang 
asdf reshim elixir 
asdf reshim nodejs

mix local.hex --force \
  && mix local.rebar --force \
  && mix archive.install --force hex phx_new 1.5.8

cd metricator && mix deps.get
