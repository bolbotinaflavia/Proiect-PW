require "application_system_test_case"

class RezervaresTest < ApplicationSystemTestCase
  setup do
    @rezervare = rezervares(:one)
  end

  test "visiting the index" do
    visit rezervares_url
    assert_selector "h1", text: "Rezervares"
  end

  test "should create rezervare" do
    visit rezervares_url
    click_on "New rezervare"

    fill_in "Email", with: @rezervare.email
    fill_in "Nume", with: @rezervare.nume
    fill_in "Prenume", with: @rezervare.prenume
    fill_in "Telefon", with: @rezervare.telefon
    click_on "Create Rezervare"

    assert_text "Rezervare was successfully created"
    click_on "Back"
  end

  test "should update Rezervare" do
    visit rezervare_url(@rezervare)
    click_on "Edit this rezervare", match: :first

    fill_in "Email", with: @rezervare.email
    fill_in "Nume", with: @rezervare.nume
    fill_in "Prenume", with: @rezervare.prenume
    fill_in "Telefon", with: @rezervare.telefon
    click_on "Update Rezervare"

    assert_text "Rezervare was successfully updated"
    click_on "Back"
  end

  test "should destroy Rezervare" do
    visit rezervare_url(@rezervare)
    click_on "Destroy this rezervare", match: :first

    assert_text "Rezervare was successfully destroyed"
  end
end
