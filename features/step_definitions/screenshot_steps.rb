####################################
#              ACTIONS             #
####################################
When 'I navigate to home page' do
  HomePage.open
end

When 'I force making screenshot and saving source page' do
  HomePage.on do
    Capybara::Screenshot.screenshot_and_save_page
  end
end

####################################
#              CHECKS              #
####################################
Then 'I should see screenshot in log directory' do
  screenshot = File.join(File.dirname(__FILE__), '../../log/screenshot.png')
  expect(File).to be_exist(screenshot)
end

Then 'I should see source page in log directory' do
  source_page = File.join(File.dirname(__FILE__), '../../log/screenshot.html')
  expect(File).to be_exist(source_page)
end
