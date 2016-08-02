####################################
#              ACTIONS             #
####################################

When /^I submit sign up form on sign up page$/ do
  SignUpPage.on { submit_form }
end

When /^I fill form on sign up page$/ do
  user = @user
  SignUpPage.on do
    fill_form(user_name: user.name,
              email: user.email,
              password: user.password,
              password_confirmation: user.password_confirmation)
  end
end

When /^I fill form on sign up page with new data$/ do
  user = @user = build(:user)
  SignUpPage.on do
    fill_form(user_name: user.name,
              email: user.email,
              password: user.password,
              password_confirmation: user.password_confirmation)
  end
end

When /^I fill form on sign up page with blank data$/ do
  SignUpPage.on { fill_form }
end

When /^I fill form on sign up page with not email data$/ do
  user = @user = build(:user)
  SignUpPage.on do
    fill_form(email: 'test.123456789',
              password: user.password,
              password_confirmation: user.password_confirmation)
  end
end

When /^I fill form on sign up page with short password$/ do
  user = @user = build(:user)
  SignUpPage.on do
    fill_form(email: user.email,
              password: '123456',
              password_confirmation: '123456')
  end
end

When /^I fill form on sign up page with different password data$/ do
  user = @user = build(:user)
  SignUpPage.on do
    fill_form(email: user.email,
              password: '1234567890',
              password_confirmation: '123456')
  end
end

When /^I fill form on change password page$/ do
  user = @user
  ChangePasswordPage.on do
    fill_form(new_password: user.password,
              confirm_new_password: user.password_confirmation)
  end
end

When /^I fill form on change password page with different data$/ do
  user = @user
  ChangePasswordPage.on do
    fill_form(new_password: user.password,
              confirm_new_password: 'incorrect')
  end
end

When /^I fill form on change password page with short password$/ do
  ChangePasswordPage.on do
    fill_form(new_password: '123456',
              confirm_new_password: '123456')
  end
end

When /^I fill form on forgot password page$/ do
  user = @user
  ForgotPasswordPage.on { fill_form(email: user.email) }
end

When /^I fill form on forgot password page with incorrect data$/ do
  ForgotPasswordPage.on { fill_form(email: 'test@resetpassword.com') }
end

When /^I fill form on forgot password page with not email data$/ do
  ForgotPasswordPage.on { fill_form(email: 'test.123456789') }
end

When /^I confirm resetting password from (.+) email$/ do |email|
  email.as_email_class.find_by_recipient(@user.email).confirm_my_account
end

When /^I fill form on login page with blank data$/ do
  LoginPage.on { fill_form }
end

When /^I fill form on login page with incorrect email$/ do
  user = @user
  LoginPage.on { fill_form(email:'test@test.com', password: user.password) }
end

When /^I fill form on login page with incorrect password$/ do
  user = @user
  LoginPage.on { fill_form(email: user.email, password: 'incorrect_password') }
end

When /^I fill form on login page with not email data$/ do
  user = @user
  LoginPage.on { fill_form(email: 'test.1234567890', password: user.password) }
end

When /^I confirm sing up from (.+) email$/ do |email|
  email.as_email_class.find_by_recipient(@user.email).confirm_my_account
end

####################################
#              CHECKS              #
####################################

Then /^I should receive (.+) email$/ do |email|
  email.as_email_class.find_by_recipient(@user.email)
end
