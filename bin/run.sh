#!/bin/bash
set -xeuo pipefail
mix deps.get
mix ecto.reset
mix test
if [ -f /.dockerenv ]; then # Docker environment
    mix local.hex --force
    mix phx.server
else
    iex -S mix phx.server
fi
