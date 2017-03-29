require 'test_helper'
require 'cru_dns/map_builder'

module CruDns
  class MapBuilderTest < ActiveSupport::TestCase
    setup do
      @builder = MapBuilder

      @a = create :record_a
      @mx = create :record_mx
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
      assert_equal [@mx.value, @mx.priority], map['MX']['example.com']
    end
  end
end
