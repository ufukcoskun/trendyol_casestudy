class Login

  def login_page_url
    url = 'https://www.trendyol.com/login'
    return url
  end

  def login_button
    element = "[type='submit']"
    return element
  end

  def login_email
    element = "[name='login email']"
    return element
  end

  def login_pass
    element = "[name='login-password']"
    return element
  end

  def login_check
    element = "//span[@id='not-logged-in-container' and @class='hidden-container']"
    return element
  end

end