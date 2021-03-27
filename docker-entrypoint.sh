#!/usr/bin/env bash

PORT=${PORT:-4567}

gollum --port "${PORT}" "$@"
