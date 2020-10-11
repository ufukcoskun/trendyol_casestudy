require 'assert_url'

include AssertUrl

class Visit

  extend AssertUrl

  def category (category)
    element = "[href='/butik/liste/" + category + "']"
    return element
  end

  def check_path (path)
    assert_path_equal path, "http://www.trendyol.com" + path
  end


end