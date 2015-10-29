When /^I click (.+) article button on article page$/ do |button|
  ArticlePage.given.click_article_button(button)
end

When /^I click Edit article button on article list page$/ do
  ArticleListPage.given.edit_article(@article.title)
end
Then /^I should see article parameters on (.+) page$/ do |page|
  expect(page.given.text).to include(@article.title)
  expect(page.given.text).to include(@article.text)
end

Then /^I should see new article parameters on (.+) page$/ do |page|
  expect(page.given.text).to include(@new_article.title)
  expect(page.given.text).to include(@new_article.text)
end

Then /^I should see articles parameters on (.+) page$/ do |page|
  expect(page.given.text).to include(@article1.title)
  expect(page.given.text).to include(@article1.text)
  expect(page.given.text).to include(@article2.title)
  expect(page.given.text).to include(@article2.text)
end