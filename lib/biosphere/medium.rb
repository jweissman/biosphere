module Biosphere
  class Medium < Abstracta::World
    def territory_class; Organism end

    def initialize(geometry=[10,10], opts={})
      opts = opts.merge({territory_count: Biosphere.medium.organisms})
      super(geometry, opts)
      @cycle = 24
    end

    def size
      Biosphere.cell.size
    end

    def project_geometry
      [width * size, height * size]
    end

    def render(window=Biosphere.game.window)

      # has got to be some 'clear bg' command that's faster than this
      bg = Gosu::Color::GRAY
      w,h = project_geometry
      window.draw_quad(0,0,bg,
		       0,h,bg,
		       w,0,bg,
		       w,h,bg)

      @territories.each(&:render)
    end


    def self.reify_geometry(width,height)
      w,h = (width/Biosphere.cell.size).to_i, (height/Biosphere.cell.size).to_i
      [w,h]
    end

    def self.bootstrap_game
      width      = Biosphere.game.width
      height     = Biosphere.game.height
      m = new(reify_geometry(width,height))
      Game.new(m) #.show
    end
  end
end
