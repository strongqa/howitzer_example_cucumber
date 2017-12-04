Given 'eyes are opened' do
  Applitools.register_capybara_driver browser: :chrome
  @eyes = Applitools::Selenium::Eyes.new
  @eyes.api_key = ENV['APPLITOOLS_API_KEY']
  @eyes.open(app_name: 'Howitzer', test_name: 'Home page', driver: Capybara.page)
end

When 'I look at the page' do
  @eyes.check_window('Home')
end

Then 'page should not differ from the baseline' do
  @eyes.close
end
