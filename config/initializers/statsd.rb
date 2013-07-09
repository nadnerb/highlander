$statsd = Statsd.new 'localhost', 8125

#Rails.application.middleware.insert_before ActionDispatch::Static, RackStatsD::ProcessUtilization, :stats => METRICS
