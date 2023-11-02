require "test_helper"

class RezervaresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rezervare = rezervares(:one)
  end

  test "should get index" do
    get rezervares_url
    assert_response :success
  end

  test "should get new" do
    get new_rezervare_url
    assert_response :success
  end

  test "should create rezervare" do
    assert_difference("Rezervare.count") do
      post rezervares_url, params: { rezervare: { email: @rezervare.email, nume: @rezervare.nume, prenume: @rezervare.prenume, telefon: @rezervare.telefon } }
    end

    assert_redirected_to rezervare_url(Rezervare.last)
  end

  test "should show rezervare" do
    get rezervare_url(@rezervare)
    assert_response :success
  end

  test "should get edit" do
    get edit_rezervare_url(@rezervare)
    assert_response :success
  end

  test "should update rezervare" do
    patch rezervare_url(@rezervare), params: { rezervare: { email: @rezervare.email, nume: @rezervare.nume, prenume: @rezervare.prenume, telefon: @rezervare.telefon } }
    assert_redirected_to rezervare_url(@rezervare)
  end

  test "should destroy rezervare" do
    assert_difference("Rezervare.count", -1) do
      delete rezervare_url(@rezervare)
    end

    assert_redirected_to rezervares_url
  end
end
