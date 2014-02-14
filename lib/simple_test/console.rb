require 'singleton'
require 'colorize'

module SimpleTest
  class Console
    include Singleton

    def result_message(message = PASS, color = :green)
      puts message.send(color)
    end
  end
end
