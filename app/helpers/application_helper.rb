module ApplicationHelper

  FLASH_KEYS = { notice: 'alert-success', alert: 'alert-danger', login: 'alert-primary' }.freeze

  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    "http://github.com/#{author}/#{repo}"
  end

  def bootstrap_flash(key)
    FLASH_KEYS[key.to_sym]
  end

end
