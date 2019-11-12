Before do |scenario|
  Capybara.use_default_driver
  Howitzer::Log.print_feature_name(scenario.feature.name)
  Howitzer::Log.print_scenario_name(scenario.name)
  @session_start = CapybaraHelpers.duration(Time.now.utc - Howitzer::Cache.extract(:cloud, :start_time))
end

Before('@no_poltergeist') do
  skip_this_scenario if Howitzer.driver == 'poltergeist'
end

After do |scenario|
  if CapybaraHelpers.cloud_driver?
    Howitzer::Cache.store(:cloud, :status, false) if scenario.failed?
    session_end = CapybaraHelpers.duration(Time.now.utc - Howitzer::Cache.extract(:cloud, :start_time))
    Howitzer::Log.info "CLOUD VIDEO #{@session_start} - #{session_end}" \
             " URL: #{CapybaraHelpers.cloud_resource_path(:video)}"
  elsif CapybaraHelpers.ie_browser?
    Howitzer::Log.info 'IE reset session'
    Capybara.current_session.execute_script("void(document.execCommand('ClearAuthenticationCache', false));")
  end

  test_teardown = Howitzer::Cache.extract(:teardown)
  if test_teardown.key? :category
    begin
      unless @user.is_admin
        HomePage.open
        HomePage.on { main_menu_section.choose_menu('Logout') }
        LoginPage.open
        @user = create(:user, :admin)
        LoginPage.on { login_as(out(:@user).email, out(:@user).password) }
      end
      CategoriesListPage.on do
        delete_category(out(:@category).name)
        if Howitzer.driver == 'webkit'
          driver.browser.accept_js_confirms
        else
          Capybara.current_session.accept_alert
          sleep 2
        end
      end
    rescue StandardError => e
      puts e
    end
  elsif test_teardown.key? :article
    begin
      unless @user.is_admin
        HomePage.open
        HomePage.on { main_menu_section.choose_menu('Logout') }
        LoginPage.open
        @user = create(:user, :admin)
        LoginPage.on { login_as(out(:@user).email, out(:@user).password) }
      end
      ArticleListPage.open
      ArticleListPage.on { destroy_article(out(:@article).title, true) }
    rescue StandardError => e
      puts e
    end
  end

  Howitzer::Cache.clear_all_ns
  Capybara.reset_sessions!
end

at_exit do
  if CapybaraHelpers.cloud_driver?
    Howitzer::Log.info "CLOUD SERVER LOG URL: #{CapybaraHelpers.cloud_resource_path(:server_log)}"
    CapybaraHelpers.update_cloud_job_status(passed: Howitzer::Cache.extract(:cloud, :status))
  end
end

require 'capybara-screenshot/cucumber'
