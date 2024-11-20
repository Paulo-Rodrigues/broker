describe MicroKafka::Backend::Messages::Message do
  context 'basic attributes' do
    it 'has a payload' do
      message = described_class.new(payload: { key: 'value' })

      expect(message.payload).to eq({ key: 'value' })
    end

    it 'cannot mutate the payload' do
      message = described_class.new(payload: { key: 'value' })

      expect  do
        message.payload = { payload: { another: 'other' } }
      end.to raise_error(NoMethodError)
    end

    it 'generates a timestamp' do
      message = described_class.new(payload: { key: 'value' })

      expect(message.created_at).not_to be_nil
    end

    it 'cannot pass a timestamp' do
      expect do
        described_class.new(payload: { key: 'value' }, timestamp: '123bla')
      end.to raise_error(ArgumentError)
    end

    it 'generates an id' do
      message = described_class.new(payload: { key: 'value' })

      expect(message.id).not_to be_nil
    end

    it 'cannot pass an id' do
      expect do
        described_class.new(payload: { key: 'value' }, id: 987)
      end.to raise_error(ArgumentError)
    end

    it 'default metadata' do
      message = described_class.new(payload: { key: 'value' })

      expect(message.metadata).to match([])
    end

    it 'metadata with content' do
      payload = { key: 'value' }
      metadata = [{ service_name: 'service1' }, { request_id: '123' }]
      message = described_class.new(payload:, metadata:)

      expect(message.metadata).to match(metadata)
    end
  end
end
