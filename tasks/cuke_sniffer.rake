namespace :cuke_sniffer do
  desc 'Checking code via cuke sniffer tool'
  task :check do
    require 'cuke_sniffer'

    CukeSniffer::RuleConfig::RULES[:implementation_word][:enabled] = false
    CukeSniffer::RuleConfig::RULES[:commented_code][:enabled] = false
    CukeSniffer::RuleConfig::RULES[:too_many_tags][:enabled] = false
    CukeSniffer::RuleConfig::RULES[:multiple_given_when_then][:enabled] = false
    CukeSniffer::RuleConfig::RULES[:out_of_order_steps][:enabled] = false
    # CukeSniffer::RuleConfig::RULES[:too_many_steps][:max] = 15

    cuke_sniffer = CukeSniffer::CLI.new(
      project_location: './',
      no_catalog: false
    )
    # results = cuke_sniffer.output_results
    unless cuke_sniffer.summary[:improvement_list].empty?
      puts 'Improvements are needed'
      exit(150)
    end
  end
end
