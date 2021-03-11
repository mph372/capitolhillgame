require "application_system_test_case"

class CongressesTest < ApplicationSystemTestCase
  setup do
    @congress = congresses(:one)
  end

  test "visiting the index" do
    visit congresses_url
    assert_selector "h1", text: "Congresses"
  end

  test "creating a Congress" do
    visit congresses_url
    click_on "New Congress"

    fill_in "Bill limit", with: @congress.bill_limit
    fill_in "Contribution limit", with: @congress.contribution_limit
    fill_in "Country direction", with: @congress.country_direction
    check "Include campaigns" if @congress.include_campaigns
    check "Include committees" if @congress.include_committees
    check "Include money" if @congress.include_money
    check "Include senate" if @congress.include_senate
    check "Includes leadership" if @congress.includes_leadership
    check "Interest groups" if @congress.interest_groups
    check "Is private" if @congress.is_private
    fill_in "Length of week", with: @congress.length_of_week
    fill_in "Number of states", with: @congress.number_of_states
    fill_in "Size", with: @congress.size
    check "Weeks per session" if @congress.weeks_per_session
    click_on "Create Congress"

    assert_text "Congress was successfully created"
    click_on "Back"
  end

  test "updating a Congress" do
    visit congresses_url
    click_on "Edit", match: :first

    fill_in "Bill limit", with: @congress.bill_limit
    fill_in "Contribution limit", with: @congress.contribution_limit
    fill_in "Country direction", with: @congress.country_direction
    check "Include campaigns" if @congress.include_campaigns
    check "Include committees" if @congress.include_committees
    check "Include money" if @congress.include_money
    check "Include senate" if @congress.include_senate
    check "Includes leadership" if @congress.includes_leadership
    check "Interest groups" if @congress.interest_groups
    check "Is private" if @congress.is_private
    fill_in "Length of week", with: @congress.length_of_week
    fill_in "Number of states", with: @congress.number_of_states
    fill_in "Size", with: @congress.size
    check "Weeks per session" if @congress.weeks_per_session
    click_on "Update Congress"

    assert_text "Congress was successfully updated"
    click_on "Back"
  end

  test "destroying a Congress" do
    visit congresses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Congress was successfully destroyed"
  end
end
