require 'simple_test'
require 'constants'

describe SimpleTest::Compare, "#==" do
  subject { described_class.new(A_TEST) }

  before do
    Object.class_variable_set :@@tests, []
    subject == A_TEST
  end

  it "adds test to objects tests" do
    expect(Object.tests).to eq([subject])
  end

  its(:method) { should == :== }
end

describe SimpleTest::Compare, "#!=" do
  subject { described_class.new(A_TEST) }

  before do
    Object.class_variable_set :@@tests, []
    subject != A_TEST
  end

  it "adds test to objects tests" do
    expect(Object.tests).to eq([subject])
  end

  its(:method) { should == :!= }
end

describe SimpleTest::Compare, "#run" do
  subject { described_class.new(A_TEST) }

  before { Object.class_variable_set :@@tests, [] }

  context "when expectations match" do
    context "when are supposed to match" do
      before { subject == A_TEST }

      it { expect { subject.run }.not_to raise_error }
    end

    context "when are supposed to be different" do
      before { subject != A_TEST }

      it { expect { subject.run }.to raise_error(SimpleTest::FailingTestError) }
    end
  end

  context "when expectations does not match" do
    context "when are supposed to be different" do
      before { subject != ANOTHER_TEST }

      it { expect { subject.run }.not_to raise_error }
    end

    context "when are supposed to match" do
      before { subject == ANOTHER_TEST }

      it { expect { subject.run }.to raise_error(SimpleTest::FailingTestError) }
    end
  end
end
