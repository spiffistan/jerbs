#!/bin/bash

bundle install
rake db:migrate
rake sunspot:solr:start
rake db:populate
