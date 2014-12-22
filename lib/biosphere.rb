require 'gosu'
require 'abstracta'

require 'biosphere/version'
require 'biosphere/stopwatch'
require 'biosphere/cell'
require 'biosphere/genome'
require 'biosphere/organism'
require 'biosphere/medium'
require 'biosphere/game'

require 'biosphere/renderer'

require 'biosphere/extend/array'

module Biosphere
  class << self
    def configure
      yield config if block_given?
    end

    def config
      @configuration ||= OpenStruct.new
    end

    extend Forwardable
    def_delegators :game, :font, :window
    
    def game
      config.game
    end

    def cell
      config.cell
    end

    def organism
      config.organism
    end

    def medium
      config.medium
    end
  end
end
