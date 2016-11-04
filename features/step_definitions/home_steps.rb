####################################
#              CHECKS              #
####################################
Then /^I should see today form on home page with article data$/ do
  HomePage.on { expect(find_form_text('Today')).to include(out(:@article).title) }
end
