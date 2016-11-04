
When /^I click (.+) article button on article page$/ do |button|
  ArticlePage.on { click_article_button(button) }
end

When /^I click Edit article button on article list page$/ do
  ArticleListPage.on { edit_article(out(:@article).title) }
end

Then /^I should see article parameters on (.+) page$/ do |page|
  page.on do
    expect(text).to include(out(:@article).title)
    expect(text).to include(out(:@article).text)
  end
end

Then /^I should see new article parameters on (.+) page$/ do |page|
  page.on do
    expect(text).to include(out(:@new_article).title)
    expect(text).to include(out(:@new_article).text)
  end
end

Then /^I should see articles parameters on (.+) page$/ do |page|
  page.on do
    expect(text).to include(out(:@article1).title)
    expect(text).to include(out(:@article1).text)
    expect(text).to include(out(:@article2).title)
    expect(text).to include(out(:@article2).text)
  end
end
