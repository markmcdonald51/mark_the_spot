require "application_system_test_case"

class WatchlistsTest < ApplicationSystemTestCase
  setup do
    @watchlist = watchlists(:one)
  end

  test "visiting the index" do
    visit watchlists_url
    assert_selector "h1", text: "Watchlists"
  end

  test "should create watchlist" do
    visit watchlists_url
    click_on "New watchlist"

    fill_in "Rating", with: @watchlist.rating
    fill_in "User", with: @watchlist.user_id
    fill_in "Watchable", with: @watchlist.watchable_id
    fill_in "Watchable type", with: @watchlist.watchable_type
    fill_in "Watchlist type", with: @watchlist.watchlist_type
    click_on "Create Watchlist"

    assert_text "Watchlist was successfully created"
    click_on "Back"
  end

  test "should update Watchlist" do
    visit watchlist_url(@watchlist)
    click_on "Edit this watchlist", match: :first

    fill_in "Rating", with: @watchlist.rating
    fill_in "User", with: @watchlist.user_id
    fill_in "Watchable", with: @watchlist.watchable_id
    fill_in "Watchable type", with: @watchlist.watchable_type
    fill_in "Watchlist type", with: @watchlist.watchlist_type
    click_on "Update Watchlist"

    assert_text "Watchlist was successfully updated"
    click_on "Back"
  end

  test "should destroy Watchlist" do
    visit watchlist_url(@watchlist)
    click_on "Destroy this watchlist", match: :first

    assert_text "Watchlist was successfully destroyed"
  end
end
