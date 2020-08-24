require 'test_helper'

class SubregionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get subregions_index_url
    assert_response :success
  end

end
