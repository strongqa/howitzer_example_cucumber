####################################
#              CHECKS              #
####################################
Then /^I should see today form on home page with article data$/ do
  article = @article
  HomePage.on { expect(find_form_text('Today')).to include(article.title) }
end
