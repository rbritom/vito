module Vito
  module Dsl
    class Server
      def connection(type, options = {})
        @connection ||= Vito::Connection.new(type, options)
      end

      def install(name, options = {})
        Vito::Dsl::Installation.new(name, options, @connection).install
      end
    end
  end
end
