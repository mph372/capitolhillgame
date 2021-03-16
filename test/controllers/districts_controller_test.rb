require "test_helper"

class DistrictsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @district = districts(:one)
  end

  test "should get index" do
    get districts_url
    assert_response :success
  end

  test "should get new" do
    get new_district_url
    assert_response :success
  end

  test "should create district" do
    assert_difference('District.count') do
      post districts_url, params: { district: { congress_id: @district.congress_id, district_type: @district.district_type, government_workers: @district.government_workers, median_age: @district.median_age, median_income: @district.median_income, politician_id: @district.politician_id, population: @district.population, pvi: @district.pvi, region: @district.region, state_id: @district.state_id, veteran_population: @district.veteran_population } }
    end

    assert_redirected_to district_url(District.last)
  end

  test "should show district" do
    get district_url(@district)
    assert_response :success
  end

  test "should get edit" do
    get edit_district_url(@district)
    assert_response :success
  end

  test "should update district" do
    patch district_url(@district), params: { district: { congress_id: @district.congress_id, district_type: @district.district_type, government_workers: @district.government_workers, median_age: @district.median_age, median_income: @district.median_income, politician_id: @district.politician_id, population: @district.population, pvi: @district.pvi, region: @district.region, state_id: @district.state_id, veteran_population: @district.veteran_population } }
    assert_redirected_to district_url(@district)
  end

  test "should destroy district" do
    assert_difference('District.count', -1) do
      delete district_url(@district)
    end

    assert_redirected_to districts_url
  end
end
