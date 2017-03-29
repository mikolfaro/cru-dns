require 'test_helper'
require 'database_cleaner'
require 'minitest/mock'

require 'cru_dns/server'

module CruDns
  class ServerTest < ActiveSupport::TestCase
    self.use_transactional_fixtures = false
    DatabaseCleaner.strategy = :truncation
    Celluloid.logger = Rails.logger

    setup do
      DatabaseCleaner.start

      create :record_a
      create :record_mx

      @server = Server.new
    end

    test 'resolves internal request' do
      mock_transaction.expect(:respond!, true, ['123.123.123.123'])

      @server.process(
        'example.com',
        Resolv::DNS::Resource::IN::A,
        mock_transaction
      )

      mock_transaction.verify
    end

    test 'delegates unresolvable request' do
      mock_transaction.expect(:passthrough!, true, [@server.resolver])

      @server.process(
        'engaged.it',
        Resolv::DNS::Resource::IN::A,
        mock_transaction
      )

      mock_transaction.verify
    end

    teardown do
      DatabaseCleaner.clean
    end

    def mock_transaction
      @mock_transaction ||= MiniTest::Mock.new
    end
  end
end
