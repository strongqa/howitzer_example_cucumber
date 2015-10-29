####################################
#              CHECKS              #
####################################
Then /^I should see today form on home page with article data$/ do
  expect(HomePage.given.find_form_text('Today')).to include(@article.title)
end