require "application_system_test_case"

class PoliticiansTest < ApplicationSystemTestCase
  setup do
    @politician = politicians(:one)
  end

  test "visiting the index" do
    visit politicians_url
    assert_selector "h1", text: "Politicians"
  end

  test "creating a Politician" do
    visit politicians_url
    click_on "New Politician"

    fill_in "Avatar", with: @politician.avatar
    fill_in "Charisma", with: @politician.charisma
    fill_in "Congress", with: @politician.congress_id
    fill_in "Current coh", with: @politician.current_coh
    fill_in "First name", with: @politician.first_name
    fill_in "Intelligence", with: @politician.intelligence
    check "Is currently candidate" if @politician.is_currently_candidate
    fill_in "Is incumbent", with: @politician.is_incumbent
    fill_in "Last name", with: @politician.last_name
    fill_in "Moral compass", with: @politician.moral_compass
    fill_in "Network", with: @politician.network
    fill_in "Party", with: @politician.party
    fill_in "Profession", with: @politician.profession
    fill_in "User", with: @politician.user_id
    fill_in "Work ethic", with: @politician.work_ethic
    click_on "Create Politician"

    assert_text "Politician was successfully created"
    click_on "Back"
  end

  test "updating a Politician" do
    visit politicians_url
    click_on "Edit", match: :first

    fill_in "Avatar", with: @politician.avatar
    fill_in "Charisma", with: @politician.charisma
    fill_in "Congress", with: @politician.congress_id
    fill_in "Current coh", with: @politician.current_coh
    fill_in "First name", with: @politician.first_name
    fill_in "Intelligence", with: @politician.intelligence
    check "Is currently candidate" if @politician.is_currently_candidate
    fill_in "Is incumbent", with: @politician.is_incumbent
    fill_in "Last name", with: @politician.last_name
    fill_in "Moral compass", with: @politician.moral_compass
    fill_in "Network", with: @politician.network
    fill_in "Party", with: @politician.party
    fill_in "Profession", with: @politician.profession
    fill_in "User", with: @politician.user_id
    fill_in "Work ethic", with: @politician.work_ethic
    click_on "Update Politician"

    assert_text "Politician was successfully updated"
    click_on "Back"
  end

  test "destroying a Politician" do
    visit politicians_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Politician was successfully destroyed"
  end
end
