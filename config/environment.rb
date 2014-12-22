# maybe we can try to gather some game config here
Biosphere.configure do |biosphere|
  biosphere.cell      = OpenStruct.new
  biosphere.cell.size = 100

  biosphere.game        = OpenStruct.new #( width: 1600, height: 1200 )
  biosphere.game.width  = 1600
  biosphere.game.height = 1200

  biosphere.medium = OpenStruct.new
  biosphere.medium.organisms = 1

  biosphere.organism    = OpenStruct.new
  #biosphere.organism.colors = %w[ yellow red green blue white none ]

  biosphere.environment ||= (ENV["BIOSPHERE_ENV"] || 'development').to_sym
end

puts "=== Biosphere #{Biosphere::VERSION} in #{Biosphere.config.environment}"
require_relative "../config/env/#{Biosphere.config.environment}"
