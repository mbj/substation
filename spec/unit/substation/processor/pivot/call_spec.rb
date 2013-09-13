# encoding: utf-8

require 'spec_helper'

describe Processor::Pivot, '#call' do
  subject { object.call(request) }

  let(:object)  { described_class.new(s_env, Spec::Handler::Pivot.new) }
  let(:s_env)   { double }
  let(:request) { Request.new(env, input) }
  let(:env)     { double }
  let(:input)   { double }

  let(:response) { Response::Success.new(request, request.input) }

  it { should eql(response) }
end
