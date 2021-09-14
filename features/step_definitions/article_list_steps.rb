When 'I click {word} article button on article page' do |button|
  ArticlePage.on { click_article_button(button) }
end

When 'I click Edit article button on article list page' do
  ArticleListPage.on { edit_article(out(:@article).title) }
end

When 'I search the necessary article in right sidebar on article list page' do
  ArticleListPage.on { search_article(out(:@article).title) }
end

When 'I click on category in right sidebar on article list page' do
  ArticleListPage.on { open_category_item(out(:@category).name) }
end

Then /I should see article parameters on (.+) page/ do |page|
  page.on do
    expect(text).to include(out(:@article).title.upcase)
    expect(text).to include(out(:@article).text)
  end
end

Then /I should see new article parameters on (.+) page/ do |page|
  page.on do
    expect(text).to include(out(:@article).title.upcase)
    expect(text).to include(out(:@article).text)
  end
end

Then /I should see articles parameters on (.+) page/ do |page|
  page.on do
    expect(text).to include(out(:@article).title.upcase)
    expect(text).to include(out(:@article).text)
    expect(text).to include(out(:@article2).title.upcase)
    expect(text).to include(out(:@article2).text)
  end
end

Then /I should see article on search page/ do
  SearchPage.on { is_expected.to have_article_element(lambda_args(name: out(:@article).title)) }
end

Then /I should see two articles on categories page/ do
  CategoriesPage.on do
    is_expected.to have_article_element(lambda_args(name: out(:@article).title))
    is_expected.to have_article_element(lambda_args(name: out(:@article2).title))
  end
end

Then /I should see category of created articles in right sidebar on article list page/ do
  ArticleListPage.on { is_expected.to have_category_item_element(lambda_args(name: out(:@category).name)) }
end

Then /I should see created article in recent post on article list page/ do
  ArticleListPage.on { is_expected.to have_recent_post_element(lambda_args(title: out(:@article).title)) }
end

Then /I click on article in recent post on article list page/ do
  ArticleListPage.on { open_recent_post(out(:@article).title) }
end
