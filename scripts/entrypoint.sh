#!/bin/bash
. /appenv/bin/activate
set -e
set -x

exec "$@"
