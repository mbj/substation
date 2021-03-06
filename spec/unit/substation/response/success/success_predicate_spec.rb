# encoding: utf-8

require 'spec_helper'

describe Response::Success, '#success?' do
  subject { object.success? }

  let(:object)  { described_class.new(request, output) }
  let(:request) { Request.new(env, input) }
  let(:env)     { double }
  let(:input)   { double }
  let(:output)  { double }

  it { should be(true) }
end
