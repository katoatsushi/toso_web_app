require 'test_helper'

class DetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get details_index_url
    assert_response :success
  end

  test "should get show" do
    get details_show_url
    assert_response :success
  end

  test "should get new" do
    get details_new_url
    assert_response :success
  end

  test "should get create" do
    get details_create_url
    assert_response :success
  end

  test "should get edit" do
    get details_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get details_destroy_url
    assert_response :success
  end

end
