####################################
#              ACTIONS             #
####################################
When 'I open quick start on howitzer frame' do
  HomePage.on do
    current_window.resize_to(1920, 1080)
    howitzer_home_iframe do |frame|
      sleep 3
      frame.open_quick_start
    end
  end
end

####################################
#              CHECKS              #
####################################

Then 'I should see article group on home page with article data' do
  HomePage.on { expect(find_article_group_text(1)).to include(out(:@article).title.upcase) }
end

Then 'I should see install section on howitzer frame' do
  HomePage.on do
    howitzer_home_iframe do |frame|
      expect(frame).to have_install_section_element(visible: true)
    end
  end
end
