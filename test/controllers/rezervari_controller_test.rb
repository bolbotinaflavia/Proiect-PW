require "test_helper"

class RezervariControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rezervari_index_url
    assert_response :success
  end
end
