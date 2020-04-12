#!/bin/bash

set -xeuo pipefail

mix deps.get

mix ecto.reset

mix test

# mix phx.server
iex -S mix phx.server
