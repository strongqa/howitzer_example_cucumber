#############################################################
#                      ACTIONS                              #
#############################################################

When /^I cancel account on edit account page$/ do
  EditAccountPage.on { cancel_my_account }
end

When /^I fill form on edit account page with new password and name$/ do
  @new_data = build(:user)
  EditAccountPage.on do
    fill_form(
      user_name: out(:@new_data).name,
      email: out(:@user).email,
      password: out(:@new_data).password,
      password_confirmation: out(:@new_data).password_confirmation,
      current_password: out(:@user).password
    )
  end
end

When /^I fill form on edit account page with incorrect current password$/ do
  @new_data = build(:user)
  EditAccountPage.on do
    fill_form(
      user_name: out(:@new_data).name,
      email: out(:@new_data).email,
      password: out(:@new_data).password,
      password_confirmation: out(:@new_data).password_confirmation,
      current_password: 'incorrect_password'
    )
  end
end

When /^I fill form on edit account page with incorrect password confirmation$/ do
  @new_data = build(:user)
  EditAccountPage.on do
    fill_form(
      user_name: out(:@user).name,
      email: out(:@user).email,
      password: out(:@new_data).password,
      password_confirmation: '',
      current_password: out(:@user).password
    )
  end
end

When /^I fill form on edit account page with short password$/ do
  EditAccountPage.on do
    fill_form(
      user_name: out(:@user).name,
      email: out(:@user).email,
      password: '123456',
      password_confirmation: '123456',
      current_password: out(:@user).password
    )
  end
end

When /^I fill form on edit account page with new email$/ do
  @new_data = build(:user)
  EditAccountPage.on do
    fill_form(
      user_name: out(:@user).name,
      email:  out(:@new_data).email,
      current_password: out(:@user).password
    )
  end
end

When /^I fill form on edit account page with existing email$/ do
  EditAccountPage.on do
    fill_form(
      user_name: out(:@user1).name,
      email:  out(:@user2).email,
      current_password: out(:@user1).password
    )
  end
end

When /^I fill form on login page with new password$/ do
  LoginPage.on { fill_form(email: out(:@user).email, password: out(:@new_data).password) }
end

When /^I fill form on login page with new email$/ do
  LoginPage.on { fill_form(email: out(:@new_data).email, password: out(:@user).password) }
end

When /^I confirm account from (.+) email$/ do |email|
  email.as_email_class.find_by_recipient(@new_data.email).confirm_my_account
end

When /^I fill form on edit account page with incorrect$/ do
  EditAccountPage.on do
    fill_form(
      user_name: out(:@user).name,
      email: 'test@.ua',
      current_password: out(:@user).password
    )
  end
end

####################################
#              CHECKS              #
####################################

Then(/^I should see form data on edit account page$/) do
  EditAccountPage.on do
    expect(form_data).to eq(user_name: out(:@new_data).name,
                            email: out(:@user).email,
                            password: '',
                            password_confirmation: '',
                            current_password: '')
  end
end
