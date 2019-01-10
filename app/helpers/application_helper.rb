module ApplicationHelper
  def current_year
    Date.today.year
  end

  def github_url(author, repo)
    "http://github.com/#{author}/#{repo}"
  end
end
