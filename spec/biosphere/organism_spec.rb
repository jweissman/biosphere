require 'spec_helper'
#require 'biosphere/organism'

describe Organism do
  it 'should have a color' do
    expect(Organism.colors).to include(subject.color)
  end
end
