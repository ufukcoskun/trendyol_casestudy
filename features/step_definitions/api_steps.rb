require 'json'

And /^this is an API test scenario$/ do
  $scenario_type = 'apitest'
end

And /^I get all books in store$/ do
  $tyl_request = ApiObjects.new.get_books
end

And /^I get a book with "([^"]*)" id$/ do |book_id|
  $tyl_request = ApiObjects.new.get_a_book(book_id)
end

And /^I check if response code is "([^"]*)"$/ do |code|
  expect($tyl_request.code.to_s).to eq (code)
end

And /^I add a book$/ do |table|
  # |book_author|book_title|
  # |John Smith|SRE 101|
  values = table.hashes[0]
  $tyl_request = ApiObjects.new.add_books(values[:book_author], values[:book_title] )
  puts $tyl_request
end

And /^I try adding a book without author$/ do |table|
  # |book_title|
  # |SRE 101|
  values = table.hashes[0]
  $tyl_request = ApiObjects.new.add_books_noauthor(values[:book_title])
  puts $tyl_request
end

And /^I try adding a book without title$/ do |table|
  # |book_author|
  # |John Smith|
  values = table.hashes[0]
  $tyl_request = ApiObjects.new.add_books_notitle(values[:book_author])
  puts $tyl_request
end

And /^I trying adding a book but book id is read-only$/ do |table|
  # |book_id|book_author|book_title|
  # |1|John Smith|SRE 101|
  values = table.hashes[0]
  $tyl_request = ApiObjects.new.add_no_book(values[:book_id], values[:book_author], values[:book_title] )
  puts $tyl_request
end

And /^I check if error message is "([^"]*)"$/ do |content|
  value = JSON.parse($tyl_request.body)["error"]
  expect(value.to_s).to eq(content.to_s)
end

And /^I check response msg for no book in store/ do
  value = JSON.parse($tyl_request.body)
  expect(value.to_s).to eq("")
end

