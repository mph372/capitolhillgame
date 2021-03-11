require "test_helper"

class CongressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @congress = congresses(:one)
  end

  test "should get index" do
    get congresses_url
    assert_response :success
  end

  test "should get new" do
    get new_congress_url
    assert_response :success
  end

  test "should create congress" do
    assert_difference('Congress.count') do
      post congresses_url, params: { congress: { bill_limit: @congress.bill_limit, contribution_limit: @congress.contribution_limit, country_direction: @congress.country_direction, include_campaigns: @congress.include_campaigns, include_committees: @congress.include_committees, include_money: @congress.include_money, include_senate: @congress.include_senate, includes_leadership: @congress.includes_leadership, interest_groups: @congress.interest_groups, is_private: @congress.is_private, length_of_week: @congress.length_of_week, number_of_states: @congress.number_of_states, size: @congress.size, weeks_per_session: @congress.weeks_per_session } }
    end

    assert_redirected_to congress_url(Congress.last)
  end

  test "should show congress" do
    get congress_url(@congress)
    assert_response :success
  end

  test "should get edit" do
    get edit_congress_url(@congress)
    assert_response :success
  end

  test "should update congress" do
    patch congress_url(@congress), params: { congress: { bill_limit: @congress.bill_limit, contribution_limit: @congress.contribution_limit, country_direction: @congress.country_direction, include_campaigns: @congress.include_campaigns, include_committees: @congress.include_committees, include_money: @congress.include_money, include_senate: @congress.include_senate, includes_leadership: @congress.includes_leadership, interest_groups: @congress.interest_groups, is_private: @congress.is_private, length_of_week: @congress.length_of_week, number_of_states: @congress.number_of_states, size: @congress.size, weeks_per_session: @congress.weeks_per_session } }
    assert_redirected_to congress_url(@congress)
  end

  test "should destroy congress" do
    assert_difference('Congress.count', -1) do
      delete congress_url(@congress)
    end

    assert_redirected_to congresses_url
  end
end
