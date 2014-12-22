module Biosphere
  class Genome < Abstracta::Genome # OpenStruct
    def self.default
      @default_genome ||= OpenStruct.new(
	growth: OpenStruct.new(
	  cycle:  50, #(2..4).sample,
	  limit:  10, #(20..80).sample,
	  #radius: (1..2).sample,
	  rate:   2, #(1..4).sample #(150..200).sample / 100.0,
        ),
	age_bound: 65535 #(3..9).sample,
	#influence_radius: 10,
	#sterile: false, 
	#sticky: false,
	#vision_radius: 100,
        #mobile: true, 
      )
    end
  end
end
