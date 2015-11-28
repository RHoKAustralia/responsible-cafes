module LayoutHelper
  def title
    base_title = 'Responsible Cafes'
    if @title.nil?
      base_title
    else
      "#{@title} | #{base_title}"
    end
  end
end
