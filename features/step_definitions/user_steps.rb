####################################
#              ACTIONS             #
####################################

When(/^I click on user2 email on users page$/) do
  user2 = @user2
  UsersPage.on { open_user(user2.email) }
end

####################################
#              CHECKS              #
####################################

Then /^I should see user email signed up on today's date$/ do
  user = @user
  UsersPage.on { expect(user_registration_date(user.email)).to include Date.current.to_s(:db) }
end

Then /^I should see user2 email text on (.+) page$/ do |page|
  user2 = @user2
  page.on { expect(text).to include(user2.email) }
end
