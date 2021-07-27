#!/bin/bash

cat ~/.bashrc
source ~/.bashrc

asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git 
asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git 
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git 
asdf install 
asdf reshim erlang 
asdf reshim elixir 
asdf reshim nodejs

mix local.hex --force \
  && mix local.rebar --force \
  && mix archive.install --force hex phx_new 1.5.8

mix deps.get
