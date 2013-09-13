# encoding: utf-8

require 'spec_helper'

describe Dispatcher::Action, '#call' do

  subject { object.call(request) }

  let(:object)   { described_class.new(klass, observer) }
  let(:klass)    { double }
  let(:observer) { double }
  let(:request)  { Request.new(env, input) }
  let(:env)      { double }
  let(:input)    { double }
  let(:response) { double }

  before do
    klass.should_receive(:call).with(request).and_return(response)
    observer.should_receive(:call).with(response)
  end

  it { should eql(response) }
end
