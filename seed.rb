require 'byebug'
require 'pandarus'
require 'faker'
require './scenarios/simple'

require './lib/creators'
require './lib/seeder'

include Scenarios

scenario = ARGV[0]
method = "#{scenario}_scenario"

raise "Missing scenario" unless scenario
raise "Unknown scenario #{scenario}" unless respond_to? method

Seeder.new(send(method)).call
