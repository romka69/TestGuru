module SessionsHelper

  def flash_message(handler)
    content_tag :p, flash[handler], class: "flash #{handler}" if flash[handler]
  end

end
