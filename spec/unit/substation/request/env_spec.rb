# encoding: utf-8

require 'spec_helper'

describe Request, '#env' do

  subject { object.env }

  let(:object) { described_class.new(env, input) }
  let(:env)    { double }
  let(:input)  { double }

  it { should equal(env) }
end
