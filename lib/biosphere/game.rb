require 'gosu'
require 'abstracta'

module Biosphere
  class Game < Gosu::Window
    extend Forwardable
    include Stopwatch

    attr_reader :medium
    def_delegators :medium

    def initialize(medium)
      @medium = medium

      @width  = @medium.width  * Biosphere.cell.size
      @height = @medium.height * Biosphere.cell.size
      super @width, @height, false
      self.caption   = "Biosphere v#{Biosphere::VERSION}"

      Biosphere.game.font = Gosu::Font.new(self, Gosu::default_font_name, 20)
    end

    def update; time('update') { @medium.step } end
    def draw;   time('render') { @medium.render } end
  end
end

