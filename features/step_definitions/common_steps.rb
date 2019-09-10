#############################################################
#                      PREREQUISITES                        #
#############################################################

Given 'opened browser' do
  Howitzer::Web::BlankPage.instance
end

Given /(.+) page of web application/ do |page|
  page.open
end

Given 'there is registered user' do
  @user = create(:user)
end

Given 'there is registered user1' do
  @user1 = create(:user)
end

Given 'there is registered user2' do
  @user2 = create(:user)
end

Given 'I am logged in as user1' do
  LoginPage.open
  LoginPage.on { login_as(out(:@user1).email, out(:@user1).password) }
end

Given 'article with parameters' do |table|
  ArticleListPage.on { add_new_article }
  NewArticlePage.on do
    fill_form(table.rows_hash.symbolize_keys)
    submit_form
  end
end

Given 'I am logged in as admin user' do
  @user = create(:user, :admin)
  LoginPage.open
  LoginPage.on { login_as(out(:@user).email, out(:@user).password) }
end

Given 'I am logged in as user' do
  LoginPage.open
  LoginPage.on { login_as(out(:@user).email, out(:@user).password) }
end

Given /I am on (.+) page/ do |page|
  page.open
end

Given 'user logged out' do
  ArticlePage.on { main_menu_section.choose_menu('Logout') }
end

####################################
#              ACTIONS             #
####################################

# we hanlde blank page separately
When /^I open (.+?) page$/ do |page|
  page.open
end

When /I click (.+?) menu item on (.+) page/ do |text, page|
  page.on { main_menu_section.choose_menu(text.capitalize) }
end

When /I click sign up link on login page/ do
  LoginPage.on { navigate_to_signup }
end

When /I click log in link on signup page/ do
  SignUpPage.on { navigate_to_login }
end

When 'I fill form on login page' do
  LoginPage.on { fill_form(email: out(:@user).email, password: out(:@user).password) }
end

When 'I fill form on login page with remembering credentials' do
  LoginPage.on { fill_form(email: out(:@user).email, password: out(:@user).password, remember_me: 'yes') }
end

When /I submit form on (.+) page/ do |page|
  page.on { submit_form }
end

When /I confirm (.+) account from (.+) email/ do |recipient, email|
  email.as_email_class.find_by_recipient(recipient).confirm_my_account
end

When /I click back to articles link on (.+) page/ do |page|
  page.on { back_to_article_list }
end

When 'I click Forgot password? link on login page' do
  LoginPage.on { navigate_to_forgot_password_page }
end

When /I click on (.+) link on users page/ do |email|
  UsersPage.on { open_user(email) }
end

When /I log out on (.+) page/ do |page|
  page.on { main_menu_section.choose_menu('Logout') }
end

When /I navigate to (.*) list via main menu/ do |item|
  HomePage.on { main_menu_section.choose_menu(item.capitalize) }
end

When /I am navigating on (.+) page/ do |page|
  page.open
end

When /I am trying to navigate on (.+) page/ do |page|
  page.open(validate: false)
end
####################################
#              CHECKS              #
####################################

# we hanlde blank page separately
Then /^(.+) page should be displayed$/ do |page|
  expect(page).to be_displayed
end

Then 'I should be logged in the system' do
  expect(HomePage).to be_authenticated
end

Then 'I should not be logged in the system' do
  expect(HomePage).to be_not_authenticated
end

Then /I should see following text on (.+) page:/ do |page, text|
  page.on { expect(text).to include(text) }
end

Then /I should see user email on (.+) page/ do |page|
  page.on { expect(text).to include(out(:@user).email) }
end

Then /I should receive (.+) email for (.+) recipient/ do |email, recipient|
  email.as_email_class.find_by_recipient(recipient)
end

Then /I should be redirected to (.+) page/ do |page|
  expect(page).to be_displayed
end
