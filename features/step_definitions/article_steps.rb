#############################################################
#                      PREREQUISITES                        #
#############################################################

Given /^opened article '(.*)' page$/ do |article_title|
  HomePage.given.view_article article_title
end

Given /^there is comment for article (.*) with parameter:$/ do |article, table|
  step "there is article with parameters:", Cucumber::Ast::Table.new([[:title,article.title], [:text,article.text]] )
  step "I fill new comment form on article page with data:", table
  step "I submit new comment form on article page"
end

Given /^there is article$/ do
  @article = create(:article)
end

Given /^there is article1$/ do
  @article1 = create(:article)
end

Given /^there is article2$/ do
  @article2 = create(:article)
end

Given /^there is comment for article$/ do
  @comment = @article.comments.create(body: "Some comment", user_id: User.where(email: settings.def_test_user).all.first.id)
end

Given /^there is comment1 for article$/ do
  @comment1 = @article.comments.create(body: "Some comment1", user_id: User.where(email: settings.def_test_user).all.first.id)
end

Given /^there is comment2 for article$/ do
  @comment2 = @article.comments.create(body: "Some comment2", user_id: User.where(email: settings.def_test_user).all.first.id)
end

Given /^opened article page$/ do
  ArticleListPage.open
  ArticleListPage.given.open_article(@article.title)
end

#############################################################
#                      ACTIONS                              #
#############################################################

When /^I click new article button on article list page$/ do
  ArticleListPage.given.add_new_article
end

When /^I destroy article with confirmation on article list page$/ do
  confirmation =  true
  ArticleListPage.given.destroy_article(@article.title, confirmation)
end

When /^I destroy article without confirmation on article list page$/ do
  confirmation =  false
  ArticleListPage.given.destroy_article(@article.title, confirmation)
end

When /^I click (.+) article on article list page$/ do |article|
  ArticleListPage.given.open_article(article)
end

When /^I fill new comment form on article page$/ do
  @comment = build(:comment)
  ArticlePage.given.fill_comment_form(body: @comment.body)
end

When /^I fill new comment form on article page with blank data$/ do
  ArticlePage.given.fill_comment_form(body: '')
end

When /^I submit new comment form on article page$/ do
  ArticlePage.given.submit_form
end

When /^I destroy comment with confirmation on article page$/ do
  confirmation = true
  ArticlePage.given.destroy_comment(@comment.body,confirmation)
end

When /^I destroy comment without confirmation on article page$/ do
  confirmation = false
  ArticlePage.given.destroy_comment(@comment.body,confirmation)
end

When /^I navigate to article on article list page$/ do
  ArticleListPage.open
  ArticleListPage.given.open_article(@article.title)
end

When /^I fill form on new article page$/ do
  @article = build(:article)
  NewArticlePage.given.fill_form(title: @article.title, text: @article.text)
end

When /^I fill form on new article page with blank data$/ do
  NewArticlePage.given.fill_form
end

When /^I fill form on new article page with short title$/ do
  @article = build(:article)
  NewArticlePage.given.fill_form(title: '123', text: @article.text)
end

When /^I fill form on edit article page with new data$/ do
  @new_article = build(:article)
  EditArticlePage.given.fill_form(title: @new_article.title, text: @new_article.text)
end

When /^I fill form on edit article page with blank data$/ do
  EditArticlePage.given.fill_form(title: '', text: '')
end

When /^I fill form on edit article page with short title$/ do
  EditArticlePage.given.fill_form(title: '123', text: @article.text)
end

When /^I go to the article page$/ do
  step "opened article page"
end
####################################
#              CHECKS              #
####################################

Then /^I see comment displayed on (.*) page$/ do |page|
  expect(page.given.comment_data).to eql(@comment.body)
end

Then /^I should see article on article list page$/ do
  expect(ArticleListPage.given.text).to include(@article.title)
end

Then /^I should not see article on article list page$/ do
  expect(ArticleListPage.given.text).to_not include(@article.title)
end

Then /^I should not see comment on (.+) page$/ do |page|
  expect(page.given.text).to_not include(@comment.body)
end

Then /^I should see user comment on (.+) page$/ do |page|
  expect(page.given.text).to include(@comment.body)
end

Then /^I should see comments on (.+) page$/ do |page|
  expect(page.given.text).to include(@comment1.body)
  expect(page.given.text).to include(@comment2.body)
end

Then /^I should see admin user comment on (.+) page$/ do |page|
  expect(page.given.text).to include(settings.def_test_user)
  expect(page.given.text).to include(@comment.body)
end

Then /^I should see add comment form on article page$/ do
  expect(ArticlePage.given).to be_comment_form_present
end

Then /^I should see body field on article page$/ do
  expect(ArticlePage.given).to be_body_field_present
end

Then /^I should see buttons: edit article, destroy comment, create comment on article page$/ do
  expect(ArticlePage.given).to be_edit_button_present
  expect(ArticlePage.given).to be_add_comment_button_present
  expect(ArticlePage.given).to be_destroy_comment_link_present(@comment.body)
end