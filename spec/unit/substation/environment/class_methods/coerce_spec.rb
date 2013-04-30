# encoding: utf-8

require 'spec_helper'

describe Environment, '.coerce' do

  subject { described_class.coerce(config) }

  let(:name)    { 'test' }
  let(:config)  { { name => action } }
  let(:action)  { { 'action' => 'Spec::Action::Success' } }
  let(:coerced) { { :test  => Environment::Action.coerce(name, action) } }

  it { should eql(described_class.new(coerced)) }
end
