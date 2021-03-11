require "test_helper"

class CongressControllerTest < ActionDispatch::IntegrationTest
  test "should get size:integer" do
    get congress_size:integer_url
    assert_response :success
  end

  test "should get number_of_states:integer" do
    get congress_number_of_states:integer_url
    assert_response :success
  end

  test "should get include_senate:boolean" do
    get congress_include_senate:boolean_url
    assert_response :success
  end

  test "should get include_campaigns:boolean" do
    get congress_include_campaigns:boolean_url
    assert_response :success
  end

  test "should get include_money:boolean" do
    get congress_include_money:boolean_url
    assert_response :success
  end

  test "should get include_committees:boolean" do
    get congress_include_committees:boolean_url
    assert_response :success
  end

  test "should get is_private:boolean" do
    get congress_is_private:boolean_url
    assert_response :success
  end

  test "should get includes_leadership:boolean" do
    get congress_includes_leadership:boolean_url
    assert_response :success
  end

  test "should get country_direction:integer" do
    get congress_country_direction:integer_url
    assert_response :success
  end

  test "should get weeks_per_session:boolean" do
    get congress_weeks_per_session:boolean_url
    assert_response :success
  end

  test "should get length_of_week:string" do
    get congress_length_of_week:string_url
    assert_response :success
  end

  test "should get bill_limit:integer" do
    get congress_bill_limit:integer_url
    assert_response :success
  end

  test "should get contribution_limit:integer" do
    get congress_contribution_limit:integer_url
    assert_response :success
  end

  test "should get interest_groups:boolean" do
    get congress_interest_groups:boolean_url
    assert_response :success
  end
end
