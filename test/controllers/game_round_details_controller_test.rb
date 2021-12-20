require 'test_helper'

class GameRoundDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game_round_detail = game_round_details(:one)
  end

  test "should get index" do
    get game_round_details_url
    assert_response :success
  end

  test "should get new" do
    get new_game_round_detail_url
    assert_response :success
  end

  test "should create game_round_detail" do
    assert_difference('GameRoundDetail.count') do
      post game_round_details_url, params: { game_round_detail: { palyer2_id: @game_round_detail.palyer2_id, player1_id: @game_round_detail.player1_id, status: @game_round_detail.status, winner_id: @game_round_detail.winner_id } }
    end

    assert_redirected_to game_round_detail_url(GameRoundDetail.last)
  end

  test "should show game_round_detail" do
    get game_round_detail_url(@game_round_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_game_round_detail_url(@game_round_detail)
    assert_response :success
  end

  test "should update game_round_detail" do
    patch game_round_detail_url(@game_round_detail), params: { game_round_detail: { palyer2_id: @game_round_detail.palyer2_id, player1_id: @game_round_detail.player1_id, status: @game_round_detail.status, winner_id: @game_round_detail.winner_id } }
    assert_redirected_to game_round_detail_url(@game_round_detail)
  end

  test "should destroy game_round_detail" do
    assert_difference('GameRoundDetail.count', -1) do
      delete game_round_detail_url(@game_round_detail)
    end

    assert_redirected_to game_round_details_url
  end
end
