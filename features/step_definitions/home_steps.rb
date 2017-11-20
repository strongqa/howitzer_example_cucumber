####################################
#              ACTIONS             #
####################################
When 'I open quick start on howitzer frame' do
  HomePage.on do
    howitzer_home_iframe(&:open_quick_start)
  end
end

####################################
#              CHECKS              #
####################################
Then 'I should see today form on home page with article data' do
  HomePage.on { expect(find_form_text('Today')).to include(out(:@article).title) }
end

Then 'I should see install section on howitzer frame' do
  HomePage.on do
    howitzer_home_iframe do |frame|
      expect(frame).to have_install_section_element(visible: true)
    end
  end
end
