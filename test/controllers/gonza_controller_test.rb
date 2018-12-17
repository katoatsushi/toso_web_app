require 'test_helper'

class GonzaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gonza_index_url
    assert_response :success
  end

end
