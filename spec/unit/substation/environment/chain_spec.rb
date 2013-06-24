require 'spec_helper'

describe Substation::Environment, '#chain' do

  let(:object) { described_class.build(&block) }

  let(:other)    { Chain::EMPTY }
  let(:chain)    { lambda { |_| test Spec::FAKE_HANDLER } }
  let(:dsl)      { Chain::DSL::Builder.call(registry) }
  let(:registry) { described_class::DSL.registry(&block) }
  let(:block)    { lambda { |_| register(:test, Spec::Processor) } }

  let(:expected) { Chain.new(processors) }

  context "when other is not given" do
    context "and a block is given" do
      subject { object.chain(&chain) }

      let(:processors) { dsl.processors(object, other, &chain) }

      it { should eql(expected) }
    end

    context "and no block is given" do
      subject { object.chain }

      let(:processors) { dsl.processors(object, other) }

      it { should eql(expected) }
    end
  end

  context "when other is given" do
    context "and a block is given" do
      subject { object.chain(other, &chain) }

      let(:processors) { dsl.processors(object, other, &chain) }

      it { should eql(expected) }
    end

    context "and no block is given" do
      subject { object.chain(other) }

      let(:processors) { dsl.processors(object, other) }

      it { should eql(expected) }
    end
  end
end
