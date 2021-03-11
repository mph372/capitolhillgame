require "test_helper"

class PoliticiansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @politician = politicians(:one)
  end

  test "should get index" do
    get politicians_url
    assert_response :success
  end

  test "should get new" do
    get new_politician_url
    assert_response :success
  end

  test "should create politician" do
    assert_difference('Politician.count') do
      post politicians_url, params: { politician: { avatar: @politician.avatar, charisma: @politician.charisma, congress_id: @politician.congress_id, current_coh: @politician.current_coh, first_name: @politician.first_name, intelligence: @politician.intelligence, is_currently_candidate: @politician.is_currently_candidate, is_incumbent: @politician.is_incumbent, last_name: @politician.last_name, moral_compass: @politician.moral_compass, network: @politician.network, party: @politician.party, profession: @politician.profession, user_id: @politician.user_id, work_ethic: @politician.work_ethic } }
    end

    assert_redirected_to politician_url(Politician.last)
  end

  test "should show politician" do
    get politician_url(@politician)
    assert_response :success
  end

  test "should get edit" do
    get edit_politician_url(@politician)
    assert_response :success
  end

  test "should update politician" do
    patch politician_url(@politician), params: { politician: { avatar: @politician.avatar, charisma: @politician.charisma, congress_id: @politician.congress_id, current_coh: @politician.current_coh, first_name: @politician.first_name, intelligence: @politician.intelligence, is_currently_candidate: @politician.is_currently_candidate, is_incumbent: @politician.is_incumbent, last_name: @politician.last_name, moral_compass: @politician.moral_compass, network: @politician.network, party: @politician.party, profession: @politician.profession, user_id: @politician.user_id, work_ethic: @politician.work_ethic } }
    assert_redirected_to politician_url(@politician)
  end

  test "should destroy politician" do
    assert_difference('Politician.count', -1) do
      delete politician_url(@politician)
    end

    assert_redirected_to politicians_url
  end
end
