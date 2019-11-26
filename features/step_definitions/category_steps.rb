#############################################################
#                      PREREQUISITES                        #
#############################################################

Given 'there is category' do
  @category = create(:category)
  Howitzer::Cache.store(:teardown, :category, @category.id)
end

When 'I navigate to categories list page' do
  CategoriesListPage.open
end

#############################################################
#                      ACTIONS                              #
#############################################################

When 'I click new category button on categories list page' do
  CategoriesListPage.on { add_new_category }
end

When 'I create new category on new category page' do
  @category = build(:category)
  NewCategoryPage.on { create_category(out(:@category).name) }
  Howitzer::Cache.store(:teardown, :category, @category.id)
end

When 'I click edit button near the necessary category on categories list page' do
  CategoriesListPage.on { edit_category(out(:@category).name) }
end

When 'I delete category' do
  Selenium::WebDriver.logger.level = :error
  CategoriesListPage.on do
    delete_category(out(:@category).name)
    if Howitzer.driver == 'webkit'
      driver.browser.accept_js_confirms
    else
      Capybara.current_session.accept_alert
      sleep 2
    end
  end
end

When 'I update name of category on edit category page' do
  @category = build(:category)
  EditCategoryPage.on { update_category(out(:@category).name) }
end

####################################
#              CHECKS              #
####################################

Then /^I should see created category on categories list page$/ do
  CategoriesListPage.on { is_expected.to have_category_item_element(out(:@category).name) }
end

Then /^I should not see the category$/ do
  CategoriesListPage.on { is_expected.to have_no_category_item_element(out(:@category).name) }
end
