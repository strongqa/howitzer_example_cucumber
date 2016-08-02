#############################################################
#                      ACTIONS                              #
#############################################################

When /^I cancel account on edit account page$/ do
  EditAccountPage.on { cancel_my_account }
end

When /^I fill form on edit account page with new password and name$/ do
  user = @user
  new_data = @new_data = build(:user)
  EditAccountPage.on do
    fill_form(user_name: new_data.name,
              password:new_data.password,
              password_confirmation: new_data.password_confirmation,
              current_password: user.password)
  end
end

When /^I fill form on edit account page with incorrect current password$/ do
  new_data = @new_data = build(:user)
  EditAccountPage.on do
    fill_form(password:new_data.password,
              password_confirmation: new_data.password_confirmation,
              current_password: 'incorrect_password')
  end
end

When /^I fill form on edit account page with incorrect password confirmation$/ do
  user = @user
  new_data = @new_data = build(:user)
  EditAccountPage.on do
    fill_form(password:new_data.password,
              password_confirmation: '',
              current_password: user.password)
  end
end

When /^I fill form on edit account page with short password$/ do
  user = @user
  EditAccountPage.on do
    fill_form(password:'123456',
              password_confirmation: '123456',
              current_password: user.password)
  end
end

When /^I fill form on edit account page with new email$/ do
  user = @user
  new_data = @new_data = build(:user)
  EditAccountPage.on do
    fill_form(email:  new_data.email,
              current_password: user.password)
  end
end

When /^I fill form on edit account page with existing email$/ do
  user1 = @user1
  user2 = @user2
  EditAccountPage.on do
    fill_form(email:  user2.email,
              current_password: user1.password)
  end
end

When /^I fill form on login page with new password$/ do
  user = @user
  new_data = @new_data
  LoginPage.on { fill_form(email: user.email, password: new_data.password) }
end

When /^I fill form on login page with new email$/ do
  user = @user
  new_data = @new_data
  LoginPage.on { fill_form(email: new_data.email, password: user.password) }
end

When /^I confirm account from (.+) email$/ do |email|
  email.as_email_class.find_by_recipient(@new_data.email).confirm_my_account
end

When /^I fill form on edit account page with incorrect$/ do
  user = @user
  EditAccountPage.on { fill_form(email: 'test@.ua', current_password: user.password) }
end

####################################
#              CHECKS              #
####################################

Then(/^I should see form data on edit account page$/) do
  user = @user
  new_data = @new_data
  EditAccountPage.on do
    expect(form_data).to eq({:user_name => new_data.name,
                             :email => user.email,
                             :password => '',
                             :password_confirmation => '',
                             :current_password => ''})
  end
end
