module Celluloid
  module WebSocket
    module Client
      class Connection
        def initialize(url, handler)
          @url = url
          uri = URI.parse(url)
          port = uri.port || (uri.scheme == "ws" ? 80 : 443)
          @socket = Celluloid::IO::TCPSocket.new(uri.host, port)
          @client = build_client
          @handler = handler

          async.run
        end

        private

        def build_client
          ::WebSocket::Driver.client(self).tap do |client|
            # TODO  SECURE TOKEN!!!
            client.set_header 'Authorization', 'Bearer secret_token'
          end
        end
      end
    end
  end
end

module CruDns
  class SyncClient
    include Celluloid

    def initialize
      @client = Celluloid::WebSocket::Client.new("ws://localhost:3000/websocket", current_actor)
      @counter = 0
    end

    def on_open
      debug('websocket open connection')
    end

    def on_message(data)
      @counter += 1
      info("message: #{data.inspect}")

      @client.close if @counter > 5
    end

    def on_close
      debug("websocket close connection: #{code.inspect} #{reason.inspect}")
    end
  end
end
