####################################
#              ACTIONS             #
####################################
When 'I navigate to home page' do
  HomePage.open
end

When 'I force making screenshot' do
  HomePage.on do
    Capybara::Screenshot.screenshot_and_save_page
  end
end

####################################
#              CHECKS              #
####################################
Then 'screenshot should be created and placed in log directory' do
  screenshot = File.join(File.dirname(__FILE__), '../../log/screenshot.png')
  expect(File.exist?(screenshot)).to be_truthy
end
