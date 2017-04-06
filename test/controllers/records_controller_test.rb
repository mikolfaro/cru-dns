require 'test_helper'

class RecordsControllerTest < ActionController::TestCase
  test 'should get records' do
    get :index, format: :json
    assert_response :success
  end

  test 'should create A record' do
    assert_difference 'Record.count', 1 do
      post :create, format: :json, params: {
        record_a: {
          name: 'www.example.eu',
          value: '123.123.123.123'
        }
      }
    end

    assert_response :created
  end

  test 'should create MX record' do
    assert_difference 'Record.count', 1 do
      post :create, format: :json, params: {
        record_mx: {
          name: 'www.example.eu',
          value: '123.123.123.123',
          priority: 0
        }
      }
    end

    assert_response :created
  end

  test 'should update record' do
    @record = create(:record_mx)

    put :update, format: :json, params: {
      id: @record.id,
      record_mx: {
        priority: 100
      }
    }

    assert_response :ok
    assert_equal 100, @record.reload.priority
  end

  test 'should delete record' do
    @record = create(:record_a)

    assert_difference 'Record.count', -1 do
      delete :destroy, format: :json, params: {
        id: @record.id
      }
    end

    assert_response :success
  end
end
