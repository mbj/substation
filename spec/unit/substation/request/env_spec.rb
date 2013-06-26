# encoding: utf-8

require 'spec_helper'

describe Request, '#env' do

  subject { object.env }

  let(:object) { described_class.new(name, env, input) }
  let(:name)   { mock }
  let(:env)    { mock }
  let(:input)  { mock }

  it { should be(env) }
end
