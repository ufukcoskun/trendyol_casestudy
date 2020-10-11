require 'json'

login_page = Login.new

And /^I visit trendyol login page/ do
  visit login_page.login_page_url
  wait_for_load
  page.should have_css(login_page.login_button)
end

And /^I login with a valid user/ do
  find(login_page.login_email).set "testdeneme987@gmail.com"
  find(login_page.login_pass).set "testdeneme987"
  find(login_page.login_button).click
  sleep(3)
end

And /^I check if i am login correctly/ do
  expect(login_page.login_check)
end