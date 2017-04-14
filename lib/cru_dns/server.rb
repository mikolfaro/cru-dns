require 'cru_dns/map_builder'
require 'cru_dns/sync_client'

module CruDns
  class Server < Celluloid::DNS::Server
    def initialize(*args)
      super
      ensure_connections
      @record_map = MapBuilder.call
    end

    def process(name, resource_class, transaction)
      return if resolve_internal(name, resource_class, transaction)

      logger.info "Pass through #{resource_class.name} #{name}"
      transaction.passthrough!(resolver)
    end

    def resolver
      @resolver ||= Celluloid::DNS::Resolver.new([
                                                   [:udp, '8.8.8.8', 53],
                                                   [:tcp, '8.8.8.8', 53]
                                                 ])
    end

    private

    def resolve_internal(name, resource_class, transaction)
      type = record_type(resource_class)

      result = @record_map[type] && @record_map[type][name]
      return if result.blank?
      logger.info "Resolving #{type} #{name} with #{result}"
      transaction.respond!(*result)
      true
    end

    def record_type(resource_class)
      resource_class.name.split('::')[-1]
    end

    def ensure_connections
      db_settings = Rails.configuration.database_configuration[Rails.env]
      ActiveRecord::Base.establish_connection db_settings

      @sync_client ||= SyncClient.new
    end
  end
end
