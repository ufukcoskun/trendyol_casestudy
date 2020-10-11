require 'json'

campaign_page = Campaign.new

And /^I add to basket an item/ do
  find(campaign_page.add_to_basket).click
end

And /^I check added an item to basket/ do
  expect(campaign_page.basket_preview)
end