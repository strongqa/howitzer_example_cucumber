Before do |scenario|
  begin
    Capybara.use_default_driver
    Howitzer::Log.print_feature_name(scenario.feature.name)
    Howitzer::Log.print_scenario_name(scenario.name)
    @session_start = CapybaraHelpers.duration(Time.now.utc - Howitzer::Cache.extract(:cloud, :start_time))
  rescue StandardError => e
    Howitzer::Log.error("Before scenarion hook: #{e.message}")
  end
end

After do |scenario|
  begin
    if CapybaraHelpers.cloud_driver?
      Howitzer::Cache.store(:cloud, :status, false) if scenario.failed?
      session_end = CapybaraHelpers.duration(Time.now.utc - Howitzer::Cache.extract(:cloud, :start_time))
      Howitzer::Log.info "CLOUD VIDEO #{@session_start} - #{session_end}" \
               " URL: #{CapybaraHelpers.cloud_resource_path(:video)}"
    elsif CapybaraHelpers.ie_browser?
      Howitzer::Log.info 'IE reset session'
      Capybara.current_session.execute_script("void(document.execCommand('ClearAuthenticationCache', false));")
    end
    Howitzer::Cache.clear_all_ns
    Capybara.reset_sessions!
  rescue StandardError => e
    Howitzer::Log.error("After scenario hook: #{e.message}")
  end
end

at_exit do
  begin
    if CapybaraHelpers.cloud_driver?
      Howitzer::Log.info "CLOUD SERVER LOG URL: #{CapybaraHelpers.cloud_resource_path(:server_log)}"
      CapybaraHelpers.update_cloud_job_status(passed: Howitzer::Cache.extract(:cloud, :status))
    end
  rescue StandardError => e
    Howitzer::Log.error("At exit hook: #{e.message}")
  end
end

require 'capybara-screenshot/cucumber'
