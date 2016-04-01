Given(/^the following movies exist:$/) do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |row|
  	Movie.create(title:row['title'],rating:row['rating'],director:row['director'],release_date:row['release_date'])
  end
end
Then(/^the director of "(.*?)" should be "(.*?)"$/) do |arg1, arg2|
  Movie.where(title:arg1).first.director == arg2
end

Then(/^I should see "(.*?)" before "(.*?)"$/) do |phrase_1, phrase_2|
  first_position = page.body.index(phrase_1)
  second_position = page.body.index(phrase_2)
  first_position.should < second_position
end