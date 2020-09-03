require 'test_helper'

class HabitatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get habitats_index_url
    assert_response :success
  end

end
