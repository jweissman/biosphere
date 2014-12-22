require 'rspec'
require 'biosphere'

Biosphere.config.environment = :test

require_relative '../config/environment'
require 'profile' if Biosphere.config.profile

include Biosphere
