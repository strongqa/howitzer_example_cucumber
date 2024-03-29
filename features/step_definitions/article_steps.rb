#############################################################
#                      PREREQUISITES                        #
#############################################################

Given 'opened article {string} page' do |article_title|
  HomePage.on { view_article article_title }
end

Given /there is comment for article (.*) with parameter:/ do |article, table|
  step 'there is article with parameters:', Cucumber::Ast::Table.new([[:title, article.title], [:text, article.text]])
  step 'I fill new comment form on article page with data:', table
  step 'I submit new comment form on article page'
end

Given 'there is article' do
  @article = create(:article, category: create(:category, :default))
  Howitzer::Cache.store(:teardown, :article, @article.id)
end

Given 'there is article1' do
  @article = create(:article, category: create(:category, :default))
  Howitzer::Cache.store(:teardown, :article, @article.id)
end

Given 'there is article2' do
  @article2 = create(:article, category: create(:category, :default))
  Howitzer::Cache.store(:teardown, :article2, @article2.id)
end

Given 'there is article1 with special category' do
  @category = create(:category)
  @article = create(:article, category: @category)
end

Given 'there is article2 with special category' do
  @article2 = create(:article, category: @category)
  Howitzer::Cache.store(:teardown, :category, @category.id)
end

Given 'there is comment for article' do
  @comment = create(:comment, article: @article, user: create(:user, :default))
end

Given 'there is comment1 for article' do
  @comment1 = create(:comment, article: @article, user: create(:user, :default))
end

Given 'there is comment2 for article' do
  @comment2 = create(:comment, article: @article, user: create(:user, :default))
end

Given 'opened article page' do
  ArticleListPage.open
  ArticleListPage.on { open_article(out(:@article).title) }
end

#############################################################
#                      ACTIONS                              #
#############################################################

When 'I click new article button on article list page' do
  ArticleListPage.on { add_new_article }
end

When 'I destroy article with confirmation on article list page' do
  ArticleListPage.on { destroy_article(out(:@article).title, confirmation: true) }
end

When 'I destroy article without confirmation on article list page' do
  ArticleListPage.on { destroy_article(out(:@article).title, confirmation: false) }
end

When /I click (.+) article on article list page/ do |article|
  ArticleListPage.on { open_article(article) }
end

When 'I fill new comment form on article page' do
  @comment = build(:comment)
  ArticlePage.on { fill_comment_form(body: out(:@comment).body) }
end

When 'I fill new comment form on article page with blank data' do
  ArticlePage.on { fill_comment_form(body: '') }
end

When 'I submit new comment form on article page' do
  ArticlePage.on { submit_form }
end

When 'I destroy comment with confirmation on article page' do
  ArticlePage.on { destroy_comment(out(:@comment).body, confirmation: true) }
end

When 'I destroy comment without confirmation on article page' do
  ArticlePage.on { destroy_comment(out(:@comment).body, confirmation: false) }
end

When 'I navigate to article on article list page' do
  ArticleListPage.open
  ArticleListPage.on { open_article(out(:@article).title) }
end

When 'I fill form on new article page' do
  @article = build(:article)
  NewArticlePage.on { fill_form(title: out(:@article).title, text: out(:@article).text) }
end

When 'I fill form for second article on new article page' do
  build(:article).tap do |a|
    @article2.title = a.title
    @article2.text = a.text
  end
  NewArticlePage.on { fill_form(title: out(:@article2).title, text: out(:@article2).text) }
end

When 'I fill form on new article page with blank data' do
  NewArticlePage.on { fill_form }
end

When 'I fill form on new article page with short title' do
  @article = build(:article)
  NewArticlePage.on { fill_form(title: '123', text: out(:@article).text) }
end

When 'I fill form on edit article page with new data' do
  build(:article).tap do |a|
    @article.title = a.title
    @article.text = a.text
  end
  EditArticlePage.on { fill_form(title: out(:@article).title, text: out(:@article).text) }
end

When 'I fill form on edit article page with blank data' do
  EditArticlePage.on { fill_form(title: '', text: '') }
end

When 'I fill form on edit article page with short title' do
  EditArticlePage.on { fill_form(title: '123', text: out(:@article).text) }
end

When 'I go to the article page' do
  step 'opened article page'
end
####################################
#              CHECKS              #
####################################

Then /I see comment displayed on (.*) page/ do |page|
  page.on { expect(comment_data).to eql(out(:@comment).body) }
end

Then 'I should see article on article list page' do
  ArticleListPage.on { expect(text).to include(out(:@article).title.upcase) }
end

Then 'I should not see article on article list page' do
  ArticleListPage.on { expect(text).to_not include(out(:@article).title) }
end

Then /I should not see comment on (.+) page/ do |page|
  page.on { expect(text).to_not include(out(:@comment).body) }
end

Then /I should see user comment on (.+) page/ do |page|
  page.on { expect(text).to include(out(:@comment).body) }
end

Then /I should see comments on (.+) page/ do |page|
  page.on do
    expect(text).to include(out(:@comment1).body)
    expect(text).to include(out(:@comment2).body)
  end
end

Then /I should see admin user comment on (.+) page/ do |page|
  page.on do
    expect(page.given.text).to include(out(:@user).name.upcase)
    expect(page.given.text).to include(out(:@comment).body)
  end
end

Then 'I should see add comment form on article page' do
  ArticlePage.on { is_expected.to have_comment_form_element }
end

Then 'I should see body field on article page' do
  ArticlePage.on { is_expected.to have_comment_field_element }
end

Then 'I should see buttons: edit article, destroy comment, create comment on article page' do
  ArticlePage.on do
    is_expected.to have_edit_article_button_element
    is_expected.to have_add_comment_button_element
    is_expected.to have_destroy_comment_element
  end
end
