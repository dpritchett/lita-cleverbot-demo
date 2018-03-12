require 'spec_helper'

describe Lita::Handlers::CleverbotDemo, lita_handler: true do
  it { is_expected.to route('Lita cleverbot hello') }
  it { is_expected.to_not route('Lita clever hello') }

  describe 'ask cleverbot a question' do
    context 'given an english input' do
      let(:question) { 'hi cleverbot' }
      let(:result) { subject.ask_cleverbot question }

      it 'fetches a response with more than one word' do
        word_count = result.split.count

        expect(word_count).to be > 1
        expect(result).to match(/\w+/)
      end
    end
  end

  describe 'lita integration test' do
    it 'answers questions with cleverbot' do
      send_message 'Lita cleverbot hello cleverbot'

      expect(replies.last).to match(/\w+/)
    end
  end
end
