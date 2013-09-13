# encoding: utf-8

require 'spec_helper'

describe Response, '#env' do

  subject { object.env }

  let(:object)   { Class.new(described_class).new(request, output) }
  let(:request)  { Request.new(env, input) }
  let(:env)      { double }
  let(:input)    { double }
  let(:output)   { double }

  it { should equal(env) }
end
