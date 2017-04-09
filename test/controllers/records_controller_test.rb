require 'test_helper'

class RecordsControllerTest < ActionController::TestCase
  test 'should get records' do
    get :index, format: :json
    assert_response :success
  end
end
