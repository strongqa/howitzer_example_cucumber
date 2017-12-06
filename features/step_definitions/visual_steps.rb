Given 'eyes are opened' do
  Applitools.register_capybara_driver browser: :chrome
  @eyes = Applitools::Selenium::Eyes.new
  @eyes.api_key = ENV['APPLITOOLS_API_KEY'] || '97KBj0cag7VZg6Licgou3jvNagW8W3nyGJZ101kd22XCgw110'
  @eyes.open(app_name: 'Howitzer', test_name: 'Home page', driver: Capybara.page)
end

When 'I look at the page' do
  @eyes.check_window('Home')
end

Then 'page should not differ from the baseline' do
  @eyes.close
end

Then 'I make screenshot to upload it for comparison' do
  result = @client.submit_test({
                         name: 'Homepage',
                         browser: Capybara.current_driver,
                         size: '1200',
                         screenshot: File.new(Capybara.page.save_screenshot('homepage.png')),
                         source_url: Capybara.page.current_path
                     })
  expect(result[:pass]).to be_truthy
end