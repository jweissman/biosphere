module Biosphere
  class Renderer
    def initialize(xy)
      @xy = xy
    end

    def x; @xy.x end
    def y; @xy.y end

    def self.at(xy); new(xy) end
  end

  class CellRenderer < Renderer
    def cell_coordinates
      return @cell_coordinates if @cell_coordinates
      s = Biosphere.config.cell.size
      x1,y1,x2,y2 = x*s, y*s, (x+1)*s, (y+1)*s
      @cell_coordinates = [[x1,y1],[x1,y2],[x2,y1],[x2,y2]]
    end

    def render(color=Gosu::Colors::WHITE, window=Biosphere.config.game.window)
      coords_with_colors = cell_coordinates.map { |c| c + [color] }
      window.draw_quad(*coords_with_colors.flatten) if window
    end
  end

  class TextRenderer < Renderer
    def render(text="hello world", color=Gosu::Colors::WHITE, font=Biosphere.config.game.font)
      font.draw(text, x, y, ZOrder::UI, 1.0, 1.0, 0xffffff00)
    end
  end

  class RendererFactory
    def initialize(xy)
      @xy = xy
    end

    def cell(color=Gosu::Color::WHITE)
      CellRenderer.new(@xy).render(color)
    end
  end
end
