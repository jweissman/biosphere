class String
  def render(x,y)
    Biosphere::TextRenderer.new(xy).render(self)
  end
end
