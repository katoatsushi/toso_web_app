require 'test_helper'

class ReformsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get reforms_new_url
    assert_response :success
  end

end
