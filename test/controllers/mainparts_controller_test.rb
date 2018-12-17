require 'test_helper'

class MainpartsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mainparts_index_url
    assert_response :success
  end

  test "should get show" do
    get mainparts_show_url
    assert_response :success
  end

end
