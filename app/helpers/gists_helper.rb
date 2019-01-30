module GistsHelper
  def hash_from_url(url)
    url.split('/').last
  end
end
