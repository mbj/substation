# encoding: utf-8

require 'spec_helper'

describe Event, '#actor' do

  subject { object.actor }

  let(:object) do
    Class.new(described_class) {
      register_as :test
    }.new(action, date, response_data)
  end

  let(:action)        { mock(:name => mock, :actor => actor, :data => mock) }
  let(:actor)         { mock }
  let(:date)          { mock }
  let(:response_data) { mock }

  it { should be(actor) }
end
