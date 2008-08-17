# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def set_title(title, subtitle = nil)
    content_for(:title, title)
    content_for(:subtitle, subtitle) if subtitle
  end  
end
