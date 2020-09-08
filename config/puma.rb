workers workers ENV.fetch("WORKERS") { 1 }
preload_app!

on_worker_boot do |worker|
  # puts "\n####\nNew Worker #{worker} Started\n####"
end
