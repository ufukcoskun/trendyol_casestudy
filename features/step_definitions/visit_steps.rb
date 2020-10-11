require 'json'

visit_page = Visit.new
campaign_page = Campaign.new

And /^I click "([^"]*)" category menu link/ do |category|
  find(visit_page.category(category)).click
  wait_for_load
  #do_match
  check_images
end

And /^I check if i am at "([^"]*)" path/ do |path|
  visit_page.check_path(path)
end

And /^I go to a random boutique/ do
  boutiques = ["/butik/liste/ev--yasam", "/butik/liste/supermarket", "/butik/liste/kozmetik", "/butik/liste/ayakkabi--canta", "/butik/liste/saat--aksesuar", "/butik/liste/elektronik"]
  choice = boutiques.sample
  visit("http://www.trendyol.com"+choice)
  wait_for_load
  check_images
end

And /^I click to first campaign/ do
  find(campaign_page.first_campaign).click
  wait_for_load
  expect(campaign_page.all_products)
end

And /^I click to first product/ do
  find(campaign_page.first_product).click
  wait_for_load
  expect(campaign_page.add_to_basket)
end