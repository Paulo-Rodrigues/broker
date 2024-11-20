module MicroKafka
  module Backend
    module Topics
      class Topic
        attr_reader :name, :partition_quantity, :partitions

        def initialize(name:, partition_quantity: 1)
          @name = name
          @partition_quantity = partition_quantity
          @partitions = create_partitions
        end

        private

        def create_partitions
          Array.new(partition_quantity)
        end
      end
    end
  end
end
