require 'simple_test'
require 'constants'

describe Object, "#must" do
  let(:compare) { double(:compare).as_null_object }

  before { allow(SimpleTest::Compare).to receive(:new) { compare } }

  it "creates a compare object" do
    expect(subject.must).to eq(compare)
  end
end

describe Object, ".add_test" do
  before do
    Object.class_variable_set :@@tests, []
    Object.add_test(A_TEST)
  end

  it "adds test" do
    expect(Object.tests).to eq([A_TEST])
  end
end

describe Object, ".run" do
  let(:test) { double(:test).as_null_object }
  let(:console) { double(:console).as_null_object }

  before do
    allow(SimpleTest::Console).to receive(:instance) { console }
    Object.class_variable_set :@@tests, []
    Object.add_test(test)
  end

  after { Object.run }

  it "runs all tests" do
    expect(test).to receive(:run)
  end

  context "when test fails" do
    before { allow(test).to receive(:run) { raise SimpleTest::FailingTestError, A_MESSAGE } }

    it "prints error message" do
      expect(console). to receive(:result_message).with(A_MESSAGE, :red)
    end
  end

  context "when test passes" do
    it "prints pass message" do
      expect(console). to receive(:result_message).with(no_args)
    end
  end
end
