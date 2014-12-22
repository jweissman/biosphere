class Array
  def render
    Biosphere::RendererFactory.new(self)
  end
end
