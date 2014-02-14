module SimpleTest
  class Compare

    attr_reader :method

    def initialize(expectation)
      @expectation = expectation
    end

    def ==(comparison)
      set_info(comparison, :==)
    end

    def !=(comparison)
      set_info(comparison, :!=)
    end

    def run
      raise FailingTestError, error_message unless pass?
    end

    private
    def set_info(comparison, method)
      @comparison = comparison
      @method = method
      Object.add_test(self)
    end

    def pass?
      @expectation.send(@method, @comparison)
    end

    def error_message
      "expect #{@expectation} to #{@method} #{@comparison}"
    end
  end
end
