require 'tzinfo'
require 'securerandom'

module MicroKafka
  module Backend
    module Messages
      Message = Data.define(:payload, :metadata) do
        def initialize(payload:, metadata: [])
          super
        end

        def id
          SecureRandom.uuid_v7
        end

        def created_at
          timezone = TZInfo::Timezone.get('America/Sao_Paulo')
          local_time = timezone.to_local(Time.now)
          local_time.strftime('%d/%m/%Y %H:%M:%S')
        end
      end
    end
  end
end
