describe MicroKafka::Backend::Topics::Topic do
  it 'a topic has a name' do
    topic = described_class.new(name: 'test_topic')

    expect(topic.name).to eq('test_topic')
  end

  it 'a topic has a default partition quantity' do
    topic = described_class.new(name: 'test_topic')

    expect(topic.partition_quantity).to eq(1)
  end

  it 'set a diferent number o partitions' do
    topic = described_class.new(name: 'test_topic', partition_quantity: 3)

    expect(topic.partition_quantity).to eq(3)
  end

  it '#partitions' do
    topic = described_class.new(name: 'test_topic')

    expect(topic.partitions.size).to eq(1)
  end
end
