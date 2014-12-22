module Biosphere  
  class Organism < Abstracta::Territory
    include Gosu
    attr_accessor :color

    def initialize(occupants=[], color=nil)
      @color = color || Organism.colors.sample

      dna = Biosphere::Genome.default
      dna.growth.limit = Biosphere.organism.max_size
      super(occupants, dna)
    end

    def occupant_class; Cell end

    def render
      occupants.each(&:render) 
      adjacent.take(projected_growth).each { |c| c.render.cell } #(&:render_cell)
    end

    def self.colors
      [ 0xEFEFEFEF ]
    end
  end
end
