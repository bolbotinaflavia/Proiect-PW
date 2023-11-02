require "test_helper"

class EvenimentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @eveniment = eveniments(:one)
  end

  test "should get index" do
    get eveniments_url
    assert_response :success
  end

  test "should get new" do
    get new_eveniment_url
    assert_response :success
  end

  test "should create eveniment" do
    assert_difference("Eveniment.count") do
      post eveniments_url, params: { eveniment: { descriere: @eveniment.descriere, end_time: @eveniment.end_time, start_time: @eveniment.start_time, titlu: @eveniment.titlu } }
    end

    assert_redirected_to eveniment_url(Eveniment.last)
  end

  test "should show eveniment" do
    get eveniment_url(@eveniment)
    assert_response :success
  end

  test "should get edit" do
    get edit_eveniment_url(@eveniment)
    assert_response :success
  end

  test "should update eveniment" do
    patch eveniment_url(@eveniment), params: { eveniment: { descriere: @eveniment.descriere, end_time: @eveniment.end_time, start_time: @eveniment.start_time, titlu: @eveniment.titlu } }
    assert_redirected_to eveniment_url(@eveniment)
  end

  test "should destroy eveniment" do
    assert_difference("Eveniment.count", -1) do
      delete eveniment_url(@eveniment)
    end

    assert_redirected_to eveniments_url
  end
end
