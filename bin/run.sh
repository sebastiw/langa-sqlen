#!/bin/bash

set -xeuo pipefail

mix deps.get

mix ecto.setup

mix test

mix phx.server
