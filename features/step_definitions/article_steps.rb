#############################################################
#                      PREREQUISITES                        #
#############################################################

Given /^opened article '(.*)' page$/ do |article_title|
  HomePage.on { view_article article_title }
end

Given /^there is comment for article (.*) with parameter:$/ do |article, table|
  step 'there is article with parameters:', Cucumber::Ast::Table.new([[:title, article.title], [:text, article.text]])
  step 'I fill new comment form on article page with data:', table
  step 'I submit new comment form on article page'
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
  @comment = @article.comments.create(
    body: 'Some comment',
    user_id: User.where(email: settings.def_test_user).all.first.id
  )
end

Given /^there is comment1 for article$/ do
  @comment1 = @article.comments.create(
    body: 'Some comment1',
    user_id: User.where(email: settings.def_test_user).all.first.id
  )
end

Given /^there is comment2 for article$/ do
  @comment2 = @article.comments.create(
    body: 'Some comment2',
    user_id: User.where(email: settings.def_test_user).all.first.id
  )
end

Given /^opened article page$/ do
  article = @article
  ArticleListPage.open
  ArticleListPage.on { open_article(article.title) }
end

#############################################################
#                      ACTIONS                              #
#############################################################

When /^I click new article button on article list page$/ do
  ArticleListPage.on { add_new_article }
end

When /^I destroy article with confirmation on article list page$/ do
  confirmation = true
  article = @article
  ArticleListPage.on { destroy_article(article.title, confirmation) }
end

When /^I destroy article without confirmation on article list page$/ do
  confirmation = false
  article = @article
  ArticleListPage.on { destroy_article(article.title, confirmation) }
end

When /^I click (.+) article on article list page$/ do |article|
  ArticleListPage.on { open_article(article) }
end

When /^I fill new comment form on article page$/ do
  comment = @comment = build(:comment)
  ArticlePage.on { fill_comment_form(body: comment.body) }
end

When /^I fill new comment form on article page with blank data$/ do
  ArticlePage.on { fill_comment_form(body: '') }
end

When /^I submit new comment form on article page$/ do
  ArticlePage.on { submit_form }
end

When /^I destroy comment with confirmation on article page$/ do
  confirmation = true
  comment = @comment
  ArticlePage.on { destroy_comment(comment.body, confirmation) }
end

When /^I destroy comment without confirmation on article page$/ do
  confirmation = false
  comment = @comment
  ArticlePage.on { destroy_comment(comment.body, confirmation) }
end

When /^I navigate to article on article list page$/ do
  article = @article
  ArticleListPage.open
  ArticleListPage.on { open_article(article.title) }
end

When /^I fill form on new article page$/ do
  article = @article = build(:article)
  NewArticlePage.on { fill_form(title: article.title, text: article.text) }
end

When /^I fill form on new article page with blank data$/ do
  NewArticlePage.on { fill_form }
end

When /^I fill form on new article page with short title$/ do
  article = @article = build(:article)
  NewArticlePage.on { fill_form(title: '123', text: article.text) }
end

When /^I fill form on edit article page with new data$/ do
  new_article = @new_article = build(:article)
  EditArticlePage.on { fill_form(title: new_article.title, text: new_article.text) }
end

When /^I fill form on edit article page with blank data$/ do
  EditArticlePage.on { fill_form(title: '', text: '') }
end

When /^I fill form on edit article page with short title$/ do
  article = @article
  EditArticlePage.on { fill_form(title: '123', text: article.text) }
end

When /^I go to the article page$/ do
  step 'opened article page'
end
####################################
#              CHECKS              #
####################################

Then /^I see comment displayed on (.*) page$/ do |page|
  comment = @comment
  page.on { expect(comment_data).to eql(comment.body) }
end

Then /^I should see article on article list page$/ do
  article = @article
  ArticleListPage.on { expect(text).to include(article.title) }
end

Then /^I should not see article on article list page$/ do
  article = @article
  ArticleListPage.on { expect(text).to_not include(article.title) }
end

Then /^I should not see comment on (.+) page$/ do |page|
  comment = @comment
  page.on { expect(text).to_not include(comment.body) }
end

Then /^I should see user comment on (.+) page$/ do |page|
  comment = @comment
  page.on { expect(text).to include(comment.body) }
end

Then /^I should see comments on (.+) page$/ do |page|
  comment1 = @comment1
  comment2 = @comment2
  page.on do
    expect(text).to include(comment1.body)
    expect(text).to include(comment2.body)
  end
end

Then /^I should see admin user comment on (.+) page$/ do |page|
  comment = @comment
  page.on do
    expect(page.given.text).to include(settings.def_test_user)
    expect(page.given.text).to include(comment.body)
  end
end

Then /^I should see add comment form on article page$/ do
  ArticlePage.on { is_expected.to have_comment_form_element }
end

Then /^I should see body field on article page$/ do
  ArticlePage.on { is_expected.to have_comment_field_element }
end

Then /^I should see buttons: edit article, destroy comment, create comment on article page$/ do
  comment = @comment
  ArticlePage.on do
    is_expected.to have_edit_article_button_element
    is_expected.to have_add_comment_button_element
    is_expected.to have_destroy_comment_element(comment.body)
  end
end
