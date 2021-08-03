#!/bin/bash

mix local.hex --force \
  && mix local.rebar --force \
  && mix archive.install --force hex phx_new 1.5.8

# I don't even know what to tell you man it's just this way
cd metricator/assets && /root/.asdf/shims/npm install
cd .. && mix deps.get