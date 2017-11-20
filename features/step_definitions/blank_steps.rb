####################################
#              ACTIONS             #
####################################
When 'I open blank page in browser' do
  Howitzer::Web::BlankPage.open
end

####################################
#              CHECKS              #
####################################
Then 'blank page should be displayed in browser' do
  expect(Howitzer::Web::BlankPage).to be_displayed
end
