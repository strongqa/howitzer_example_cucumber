When /^I click (.+) article button on article page$/ do |button|
  ArticlePage.on { click_article_button(button) }
end

When /^I click Edit article button on article list page$/ do
  article = @article
  ArticleListPage.on { edit_article(article.title) }
end
Then /^I should see article parameters on (.+) page$/ do |page|
  article = @article
  page.as_page_class.on do
    expect(text).to include(article.title)
    expect(text).to include(article.text)
  end
end

Then /^I should see new article parameters on (.+) page$/ do |page|
  new_article = @new_article
  page.as_page_class.on do
    expect(text).to include(new_article.title)
    expect(text).to include(new_article.text)
  end
end

Then /^I should see articles parameters on (.+) page$/ do |page|
  article1 = @article1
  article2 = @article2
  page.as_page_class.on do
    expect(text).to include(article1.title)
    expect(text).to include(article1.text)
    expect(text).to include(article2.title)
    expect(text).to include(article2.text)
  end
end