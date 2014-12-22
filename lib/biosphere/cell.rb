module Biosphere
  class Cell < Abstracta::Occupant
    def initialize(location)
      super location
    end

    def render(color=Gosu::Color::WHITE) #,window=Biosphere.config.game.window)
      location.render.cell(color) 
      self
    end
  end
end

