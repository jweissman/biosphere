require 'spec_helper'
require 'biosphere'

describe Biosphere do
  it "should have a VERSION constant" do
    subject.const_get('VERSION').should_not be_empty
  end

  it "should be configurable" do
    Biosphere.configure do |b| 
      b.foo = "bar"  
      b.baz = OpenStruct.new(quux: 'ilex')
    end

    expect(Biosphere.config.foo).to eql("bar")
    expect(Biosphere.config.baz.quux).to eql("ilex")
  end
end
