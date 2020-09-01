require 'test_helper'

class ArControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ar_index_url
    assert_response :success
  end

  test "should get show" do
    get ar_index_url
    assert_response :success
  end

end
