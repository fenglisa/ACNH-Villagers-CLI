# require 'bundler/setup' (make sure all gems are present on machine)
# Bundler.require (require at runtime)
# gems should go in gemfile

require 'httparty'
require 'pry'

require_relative '../lib/services/api'
require_relative '../lib/models/villagers'
require_relative '../lib/services/cli'
