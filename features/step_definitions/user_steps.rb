####################################
#              ACTIONS             #
####################################

When('I click on user2 email on users page') do
  UsersPage.on { open_user(out(:@user2).email) }
end

####################################
#              CHECKS              #
####################################

Then "I should see user email signed up on today's date" do
  UsersPage.on { expect(user_registration_date(out(:@user).email)).to include Date.current.to_s(:db) }
end

Then /I should see user2 email text on (.+) page/ do |page|
  page.on { expect(text).to include(out(:@user2).email) }
end
