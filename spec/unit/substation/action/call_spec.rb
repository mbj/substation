# encoding: utf-8

require 'spec_helper'

describe Action, '#call' do
  subject { object.call(request) }

  let(:object)      { described_class.new(handler, observers) }
  let(:handler)     { Spec::Action::Success }
  let(:request)     { Request.new(action_name, env, input) }
  let(:action_name) { double }
  let(:env)         { double }
  let(:input)       { double }

  let(:response) { handler.call(request) }

  context 'when no observers are registered' do
    let(:observers) { EMPTY_ARRAY }

    it { should eql(response) }
  end

  context 'when observers are registered' do
    let(:observers) { [ Spec::Observer ] }

    before do
      Spec::Observer.should_receive(:call).with(response)
    end

    it { should eql(response) }
  end
end
