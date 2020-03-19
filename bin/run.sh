#!/bin/bash

set -xeuo pipefail

mix deps.get

mix ecto.create
mix ecto.migrate

mix test

mix phx.server
