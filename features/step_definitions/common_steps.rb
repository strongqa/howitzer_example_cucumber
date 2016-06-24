#############################################################
#                      PREREQUISITES                        #
#############################################################

Given /^opened browser$/ do
  Howitzer::Web::BlankPage.instance
end

Given /^(.+) page of web application$/ do |page|
  page.open
end

Given /^there is registered user$/ do
  @user = create(:user)
end


Given /^there is registered user1$/ do
  @user1 = create(:user)
end

Given /^there is registered user2$/ do
  @user2 = create(:user)
end

Given /^I am logged in as user1$/ do
  LoginPage.open.login_as(@user1.email, @user1.password)
end

Given /^article with parameters$/ do |table|
  article = table.rows_hash.symbolize_keys
  ArticleListPage.given.add_new_article
  NewArticlePage.given.fill_form(table.rows_hash.symbolize_keys).submit_form
end

Given /^I am logged in as admin user$/ do
  LoginPage.open.login_as(settings.def_test_user, settings.def_test_pass)
end

Given /^I am logged in as user$/ do
  LoginPage.open.login_as(@user.email, @user.password)
end

Given /^I am on (.+) page$/ do |page|
  page.open
end

Given /^user logged out$/ do
  ArticlePage.given.choose_menu('Logout')
end

####################################
#              ACTIONS             #
####################################

#we hanlde blank page separately
When /^I open (?!blank)(.+?) page$/ do |page|
  page.open
end

When /^I click (.+?) menu item on (.+) page$/ do |text, page|
  page.given.choose_menu(text.capitalize)
end

When /^I fill form on login page$/ do
  LoginPage.given.fill_form(email: @user.email, password: @user.password)
end

When /^I fill form on login page with remembering credentials$/ do
  LoginPage.given.fill_form(email: @user.email, password: @user.password, remember_me: 'yes')
end

When /^I submit form on (.+) page$/ do |page|
  page.given.submit_form
end

When /^I confirm (.+) account from (.+) email$/ do |recipient, email|
  email.as_email_class.find_by_recipient(recipient).confirm_my_account
end

When /^I click back to articles link on (.+) page$/ do |page|
  page.given.back_to_article_list
end

When /^I click Forgot password\? link on login page$/ do
  LoginPage.given.navigate_to_forgot_password_page
end

When /^I click on (.+) link on users page$/ do |email|
 UsersPage.given.open_user(email)
end

When /^I log out$/ do
  HomePage.given.choose_menu('Logout')
end

When /^I navigate to (.*) list via main menu$/ do |item|
  HomePage.given.choose_menu(item.capitalize)
end

####################################
#              CHECKS              #
####################################

#we hanlde blank page separately
Then /^(?!blank)(.+) page should be displayed$/ do |page|
  expect(page).to be_displayed
end

Then /^I should be logged in the system$/ do
  expect(HomePage).to be_authenticated
end

Then /^I should not be logged in the system$/ do
  expect(HomePage).to be_not_authenticated
end

Then /^I should see following text on (.+) page:$/ do |page, text|
  expect(page.given.text).to include(text)
end

Then /^I should see user email on (.+) page$/ do |page|
  expect(page.given.text).to include(@user.email)
end

Then /^I should receive (.+) email for (.+) recipient$/ do |email, recipient|
  email.as_email_class.find_by_recipient(recipient)
end

Then /^I should be redirected to (.+) page$/ do |page|
  page.given
end
