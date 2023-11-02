require "application_system_test_case"

class ToursTest < ApplicationSystemTestCase
  setup do
    @tour = tours(:one)
  end

  test "visiting the index" do
    visit tours_url
    assert_selector "h1", text: "Tours"
  end

  test "should create tour" do
    visit tours_url
    click_on "New tour"
    fill_in "Eveniment", with: @tour.eveniment_id
    fill_in "Data ora", with: @tour.data_ora
    fill_in "Detalii", with: @tour.detalii
    click_on "Create Tour"

    assert_text "Tour was successfully created"
    click_on "Back"
  end

  test "should update Tour" do
    visit tour_url(@tour)
    click_on "Edit this tour", match: :first
    fill_in "Eveniment", with: @tour.eveniment_id
    fill_in "Data ora", with: @tour.data_ora
    fill_in "Detalii", with: @tour.detalii
    click_on "Update Tour"

    assert_text "Tour was successfully updated"
    click_on "Back"
  end

  test "should destroy Tour" do
    visit tour_url(@tour)
    click_on "Destroy this tour", match: :first

    assert_text "Tour was successfully destroyed"
  end
end
