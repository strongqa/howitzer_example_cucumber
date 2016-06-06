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
  Howitzer::Web::BlankPage.wait_for_opened
end
