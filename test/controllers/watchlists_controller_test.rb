require "test_helper"

class WatchlistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @watchlist = watchlists(:one)
  end

  test "should get index" do
    get watchlists_url
    assert_response :success
  end

  test "should get new" do
    get new_watchlist_url
    assert_response :success
  end

  test "should create watchlist" do
    assert_difference("Watchlist.count") do
      post watchlists_url, params: { watchlist: { rating: @watchlist.rating, user_id: @watchlist.user_id, watchable_id: @watchlist.watchable_id, watchable_type: @watchlist.watchable_type, watchlist_type: @watchlist.watchlist_type } }
    end

    assert_redirected_to watchlist_url(Watchlist.last)
  end

  test "should show watchlist" do
    get watchlist_url(@watchlist)
    assert_response :success
  end

  test "should get edit" do
    get edit_watchlist_url(@watchlist)
    assert_response :success
  end

  test "should update watchlist" do
    patch watchlist_url(@watchlist), params: { watchlist: { rating: @watchlist.rating, user_id: @watchlist.user_id, watchable_id: @watchlist.watchable_id, watchable_type: @watchlist.watchable_type, watchlist_type: @watchlist.watchlist_type } }
    assert_redirected_to watchlist_url(@watchlist)
  end

  test "should destroy watchlist" do
    assert_difference("Watchlist.count", -1) do
      delete watchlist_url(@watchlist)
    end

    assert_redirected_to watchlists_url
  end
end
