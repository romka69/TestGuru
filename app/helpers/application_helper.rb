module ApplicationHelper

  FLASH_KEYS = { notice: 'alert-success', alert: 'alert-danger' }.freeze

  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    "http://github.com/#{author}/#{repo}"
  end

  def bootstrap_flash
    message = ''
    flash.each do |key, value|
      message << content_tag(:p, value, class: "alert #{FLASH_KEYS[key.to_sym]}")
    end
    message.html_safe
  end

end
