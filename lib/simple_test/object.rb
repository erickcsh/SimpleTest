class Object

  PASS = 'pass'

  @@tests = []

  def self.add_test(test)
    @@tests << test
  end

  def self.run
    @@tests.each { |test| run_test(test) }
  end

  def self.tests
    @@tests
  end

  def must
    SimpleTest::Compare.new(self)
  end

  private
  def run_test(test)
    begin
      test.run
      console.result_message
    rescue SimpleTest::FailingTestError => error
      console.result_message(error.message, :red)
    end
  end

  def console
    SimpleTest::Console.instance
  end
end
