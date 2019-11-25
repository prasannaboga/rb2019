module Rb2019

  def self.logger
    # @@logger = Logger.new(STDOUT)
    @@logger = Logger.new("logs/rb2019.log", 'daily')
  end
end
