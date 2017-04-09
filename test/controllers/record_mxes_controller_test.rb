require 'test_helper'

class RecordMxesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @record = create(:record_mx)
  end

  test 'should create MX record' do
    assert_difference 'Record::MX.count', 1 do
      post record_mxes_url(format: :json), params: {
        record_mx: {
          name: 'www.example.eu',
          value: '123.123.123.123',
          priority: 0,
          ttl_seconds: 9600
        }
      }
    end

    assert_response :created
  end

  test 'should get edit' do
    get edit_record_mx_url(@record)
    assert_response :success
  end

  test 'should update record' do
    put record_mx_url(@record, format: :json), params: {
      id: @record.id,
      record_mx: {
        priority: 100
      }
    }

    assert_response :ok
    assert_equal 100, @record.reload.priority
  end

  test 'should delete record' do
    assert_difference 'Record::MX.count', -1 do
      delete record_mx_url(@record, format: :json)
    end

    assert_response :success
  end
end
