# START:setup
require 'cleverbot'

module Lita
  module Handlers
    class CleverbotDemo < Handler

      config :cleverbot_user, default: ENV.fetch('CLEVERBOT_USER')
      config :cleverbot_key, default: ENV.fetch('CLEVERBOT_KEY')

      route /^cleverbot (.+)$/i, :handle_cleverbot
      # END:setup

      # START:implementation
      def handle_cleverbot(payload)
        clever_input = payload.matches.last

        payload.reply ask_cleverbot(clever_input)
      end

      def ask_cleverbot(question)
        client.say question
      end

      def client
        @_client ||= Cleverbot.new(config.cleverbot_user, config.cleverbot_key)
      end
      # END:implementation

      Lita.register_handler(self)
    end
  end
end
