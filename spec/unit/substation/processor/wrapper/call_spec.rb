# encoding: utf-8

require 'spec_helper'

describe Processor::Wrapper, '#call' do
  subject { object.call(response) }

  let(:object)   { described_class.new(s_env, Spec::Presenter) }
  let(:s_env)    { double }
  let(:response) { Response::Success.new(request, output) }
  let(:request)  { Request.new(env, input) }
  let(:env)      { double }
  let(:input)    { double }
  let(:output)   { double }

  let(:wrapped) { Response::Success.new(request, data) }
  let(:data)    { Spec::Presenter.new(output) }

  it { should eql(wrapped) }
end
