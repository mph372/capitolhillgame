require "application_system_test_case"

class DistrictsTest < ApplicationSystemTestCase
  setup do
    @district = districts(:one)
  end

  test "visiting the index" do
    visit districts_url
    assert_selector "h1", text: "Districts"
  end

  test "creating a District" do
    visit districts_url
    click_on "New District"

    fill_in "Congress", with: @district.congress_id
    fill_in "District type", with: @district.district_type
    fill_in "Government workers", with: @district.government_workers
    fill_in "Median age", with: @district.median_age
    fill_in "Median income", with: @district.median_income
    fill_in "Politician", with: @district.politician_id
    fill_in "Population", with: @district.population
    fill_in "Pvi", with: @district.pvi
    fill_in "Region", with: @district.region
    fill_in "State", with: @district.state_id
    fill_in "Veteran population", with: @district.veteran_population
    click_on "Create District"

    assert_text "District was successfully created"
    click_on "Back"
  end

  test "updating a District" do
    visit districts_url
    click_on "Edit", match: :first

    fill_in "Congress", with: @district.congress_id
    fill_in "District type", with: @district.district_type
    fill_in "Government workers", with: @district.government_workers
    fill_in "Median age", with: @district.median_age
    fill_in "Median income", with: @district.median_income
    fill_in "Politician", with: @district.politician_id
    fill_in "Population", with: @district.population
    fill_in "Pvi", with: @district.pvi
    fill_in "Region", with: @district.region
    fill_in "State", with: @district.state_id
    fill_in "Veteran population", with: @district.veteran_population
    click_on "Update District"

    assert_text "District was successfully updated"
    click_on "Back"
  end

  test "destroying a District" do
    visit districts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "District was successfully destroyed"
  end
end
