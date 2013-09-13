# encoding: utf-8

require 'spec_helper'

describe Chain::Outgoing, '#result' do

  subject { object.result(response) }

  let(:object) {
    Class.new {
      include Substation::Chain::Outgoing
    }.new
  }

  let(:response) { Response::Success.new(request, input) }
  let(:request)  { Request.new(env, input) }
  let(:env)      { double }
  let(:input)    { double }

  it { should be(response) }
end
