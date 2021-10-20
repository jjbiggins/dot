#!/usr/bin/env bash

if
  [[ -s "/Users/jjbiggins/.rvm/gems/ruby-3.0.0/environment" ]]
then
  source "/Users/jjbiggins/.rvm/gems/ruby-3.0.0/environment"
  exec listings-ext.sh "$@"
else
  echo "ERROR: Missing RVM environment file: '/Users/jjbiggins/.rvm/gems/ruby-3.0.0/environment'" >&2
  exit 1
fi