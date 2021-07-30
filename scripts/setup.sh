#!/bin/bash

source ~/.bashrc

mix local.hex --force \
  && mix local.rebar --force \
  && mix archive.install --force hex phx_new 1.5.8

cd metricator/assets && npm install
cd .. && mix deps.get