require 'test_helper'

class RecordsControllerTest < ActionController::TestCase
  test 'should get records' do
    get :index, format: :json
    assert_response :success
  end

  test 'should create A record' do
    assert_difference 'Record.count', 1 do
      post :create, format: :json, record_a: {
        name: 'www.example.eu',
        value: '123.123.123.123'
      }
    end

    assert_response :created
  end

  test 'should create MX record' do
    assert_difference 'Record.count', 1 do
      post :create, format: :json, record_mx: {
        name: 'www.example.eu',
        value: '123.123.123.123',
        priority: 0
      }
    end

    assert_response :created
  end
end
