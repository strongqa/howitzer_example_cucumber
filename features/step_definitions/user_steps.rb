####################################
#              ACTIONS             #
####################################

When(/^I click on user2 email on users page$/) do
  UsersPage.given.open_user(@user2.email)
end

####################################
#              CHECKS              #
####################################

Then /^I should see user email signed up on today's date$/ do
  expect(UsersPage.given.user_registration_date(@user.email)).to include (Date.current.to_s(:db))
end

Then /^I should see user2 email text on (.+) page$/ do |page|
  expect(page.given.text).to include(@user2.email)
end