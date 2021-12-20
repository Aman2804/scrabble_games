require "application_system_test_case"

class GameRoundDetailsTest < ApplicationSystemTestCase
  setup do
    @game_round_detail = game_round_details(:one)
  end

  test "visiting the index" do
    visit game_round_details_url
    assert_selector "h1", text: "Game Round Details"
  end

  test "creating a Game round detail" do
    visit game_round_details_url
    click_on "New Game Round Detail"

    fill_in "Palyer2", with: @game_round_detail.palyer2_id
    fill_in "Player1", with: @game_round_detail.player1_id
    fill_in "Status", with: @game_round_detail.status
    fill_in "Winner", with: @game_round_detail.winner_id
    click_on "Create Game round detail"

    assert_text "Game round detail was successfully created"
    click_on "Back"
  end

  test "updating a Game round detail" do
    visit game_round_details_url
    click_on "Edit", match: :first

    fill_in "Palyer2", with: @game_round_detail.palyer2_id
    fill_in "Player1", with: @game_round_detail.player1_id
    fill_in "Status", with: @game_round_detail.status
    fill_in "Winner", with: @game_round_detail.winner_id
    click_on "Update Game round detail"

    assert_text "Game round detail was successfully updated"
    click_on "Back"
  end

  test "destroying a Game round detail" do
    visit game_round_details_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Game round detail was successfully destroyed"
  end
end
