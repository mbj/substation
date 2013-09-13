# encoding: utf-8

require 'spec_helper'

describe Request, '#input' do

  subject { object.input }

  let(:object) { described_class.new(env, input) }
  let(:env)    { double }
  let(:input)  { double }

  it { should equal(input) }
end
