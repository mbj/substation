# encoding: utf-8

shared_context 'Processor#initialize' do
  let(:object)           { klass.new(processor_name, processor_config) }
  let(:processor_name)   { double('name') }
  let(:processor_config) { Processor::Config.new(handler, failure_chain, executor) }
  let(:handler)          { double('handler') }
  let(:failure_chain)    { double(:call => failure_response) }
  let(:failure_response) { double }
  let(:executor)         { Processor::Executor::NULL }
end

shared_context 'Processor::Call' do

  include_context 'Request#initialize'
  include_context 'Processor#initialize'

  let(:response)      { Response::Success.new(request, original_data) }
  let(:original_data) { double }

  let(:expected)      { Response::Success.new(request, expected_data) }
  let(:expected_data) { double }
end
