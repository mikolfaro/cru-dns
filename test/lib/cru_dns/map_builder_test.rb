require 'test_helper'
require 'cru_dns/map_builder'

module CruDns
  class MapBuilderTest < ActiveSupport::TestCase
    setup do
      @builder = MapBuilder

      @a = create :record_a
      @mx = create :record_mx
      create :inactive_record
    end

    test 'A record is created correctly' do
      map = @builder.call

      assert map.key? 'A'
      assert map['A'].key? 'example.com'
      assert_equal '123.123.123.123', map['A']['example.com']
    end

    test 'MX record is created correcty' do
      map = @builder.call

      assert map.key? 'MX'
      assert map['MX'].key? @mx.name
      assert_equal [@mx.priority, @mx.value.split('.')], map['MX']['example.com']
    end

    test 'inactive records are not loaded' do
      map = @builder.call
      assert_not map['A'].key? 'inactive.org'
    end
  end
end
