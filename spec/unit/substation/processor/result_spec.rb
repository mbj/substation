# encoding: utf-8

require 'spec_helper'

describe Processor, '#result' do

  subject { object.result(response) }

  include_context 'Processor#initialize'

  let(:klass)    { Class.new { include Substation::Processor } }
  let(:response) { Response::Success.new(request, input) }
  let(:request)  { Request.new(name, env, input) }
  let(:name)     { double }
  let(:env)      { double }
  let(:input)    { double }

  it { should be(response) }
end
