####################################
#              ACTIONS             #
####################################
When /^I open blank page$/ do
  Howitzer::Web::BlankPage.open
end

####################################
#              CHECKS              #
####################################
Then /^blank page should be displayed$/ do
  expect(Howitzer::Web::BlankPage).to be_displayed
end
