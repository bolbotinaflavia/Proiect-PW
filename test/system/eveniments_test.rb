require "application_system_test_case"

class EvenimentsTest < ApplicationSystemTestCase
  setup do
    @eveniment = eveniments(:one)
  end

  test "visiting the index" do
    visit eveniments_url
    assert_selector "h1", text: "Eveniments"
  end

  test "should create eveniment" do
    visit eveniments_url
    click_on "New eveniment"

    fill_in "Descriere", with: @eveniment.descriere
    fill_in "Timp final", with: @eveniment.timp_final
    fill_in "Timp start", with: @eveniment.timp_start
    fill_in "Titlu", with: @eveniment.titlu
    click_on "Create Eveniment"

    assert_text "Eveniment was successfully created"
    click_on "Back"
  end

  test "should update Eveniment" do
    visit eveniment_url(@eveniment)
    click_on "Edit this eveniment", match: :first

    fill_in "Descriere", with: @eveniment.descriere
    fill_in "Timp final", with: @eveniment.timp_final
    fill_in "Timp start", with: @eveniment.timp_start
    fill_in "Titlu", with: @eveniment.titlu
    click_on "Update Eveniment"

    assert_text "Eveniment was successfully updated"
    click_on "Back"
  end

  test "should destroy Eveniment" do
    visit eveniment_url(@eveniment)
    click_on "Destroy this eveniment", match: :first

    assert_text "Eveniment was successfully destroyed"
  end
end
