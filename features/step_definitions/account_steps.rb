#############################################################
#                      ACTIONS                              #
#############################################################

When /^I cancel account on edit account page$/ do
  EditAccountPage.given.cancel_my_account
end

When /^I fill form on edit account page with new password and name$/ do
  @new_data = build(:user)
  EditAccountPage.given.fill_form(user_name: @new_data.name,
                                  password:@new_data.password,
                                  password_confirmation: @new_data.password_confirmation,
                                  current_password: @user.password)
end

When /^I fill form on edit account page with incorrect current password$/ do
  @new_data = build(:user)
  EditAccountPage.given.fill_form(password:@new_data.password,
                                  password_confirmation: @new_data.password_confirmation,
                                  current_password: 'incorrect_password')
end

When /^I fill form on edit account page with incorrect password confirmation$/ do
  @new_data = build(:user)
  EditAccountPage.given.fill_form(password:@new_data.password,
                                  password_confirmation: '',
                                  current_password: @user.password)
end

When /^I fill form on edit account page with short password$/ do
  @new_data = build(:user)
  EditAccountPage.given.fill_form(password:'123456',
                                  password_confirmation: '123456',
                                  current_password: @user.password)
end

When /^I fill form on edit account page with new email$/ do
  @new_data = build(:user)
  EditAccountPage.given.fill_form(email:  @new_data.email,
                                  current_password: @user.password)
end

When /^I fill form on edit account page with existing email$/ do
  EditAccountPage.given.fill_form(email:  @user2.email,
                                  current_password: @user1.password)
end

When /^I fill form on login page with new password$/ do
  LoginPage.given.fill_form(email: @user.email, password: @new_data.password)
end

When /^I fill form on login page with new email$/ do
  LoginPage.given.fill_form(email: @new_data.email, password: @user.password)
end

When /^I confirm account from (.+) email$/ do |email|
  email.as_email_class.find_by_recipient(@new_data.email).confirm_my_account
end

When /^I fill form on edit account page with incorrect$/ do
  EditAccountPage.given.fill_form(email: 'test@.ua', current_password: @user.password)
end

####################################
#              CHECKS              #
####################################

Then(/^I should see form data on edit account page$/) do
  expect(EditAccountPage.given.form_data).to eq({:user_name => @new_data.name,
                                                :email => @user.email,
                                                :password => '',
                                                :password_confirmation => '',
                                                :current_password => ''})
end