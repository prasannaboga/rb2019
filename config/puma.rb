require "dotenv/load"

environment ENV["RACK_ENV"] = ENV.fetch("APP_ENV", "development")
workers ENV.fetch("WORKERS", 1).to_i
preload_app!

on_worker_boot do |worker|
  # puts "\n####\nNew Worker #{worker} Started\n####"
end
