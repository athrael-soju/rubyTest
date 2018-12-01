require "application_system_test_case"

class ForexesTest < ApplicationSystemTestCase
  setup do
    @forex = forexes(:one)
  end

  test "visiting the index" do
    visit forexes_url
    assert_selector "h1", text: "Forexes"
  end

  test "creating a Forex" do
    visit forexes_url
    click_on "New Forex"

    fill_in "Currency", with: @forex.currency
    fill_in "Value", with: @forex.value
    click_on "Create Forex"

    assert_text "Forex was successfully created"
    click_on "Back"
  end

  test "updating a Forex" do
    visit forexes_url
    click_on "Edit", match: :first

    fill_in "Currency", with: @forex.currency
    fill_in "Value", with: @forex.value
    click_on "Update Forex"

    assert_text "Forex was successfully updated"
    click_on "Back"
  end

  test "destroying a Forex" do
    visit forexes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Forex was successfully destroyed"
  end
end
