require 'test_helper'

class RecordAsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @record = create(:record_a)
  end

  test 'should create A record' do
    assert_difference 'Record::A.count', 1 do
      post record_as_url(format: :json), params: {
        record_a: {
          name: 'www.example.zoo',
          value: '123.123.123.123',
          ttl_seconds: 9600
        }
      }
    end

    assert_response :created
  end

  test 'should get edit' do
    get edit_record_a_url(@record)
    assert_response :success
  end

  test 'should update record' do
    put record_a_url(@record, format: :json), params: {
      id: @record.id,
      record_a: {
        value: '123.0.0.2',
      }
    }

    assert_response :ok
    assert_equal '123.0.0.2', @record.reload.value
  end

  test 'should delete record' do
    assert_difference 'Record::A.count', -1 do
      delete record_a_url(@record, format: :json)
    end

    assert_response :success
  end
end
