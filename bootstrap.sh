#!/bin/bash

echo
echo '--- Installing bundle:'
bundle install
echo
echo '--- Migrating:'
rake db:migrate
echo
echo '--- Starting solr:'
rake sunspot:solr:start
echo
echo '--- Populating database:'
rake db:populate
