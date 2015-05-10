module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | Foodweb"
    end
  end
end
