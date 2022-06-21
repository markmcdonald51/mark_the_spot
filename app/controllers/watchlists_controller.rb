class WatchlistsController < ApplicationController
  before_action :set_watchlist, only: %i[ show edit update destroy ]

  # GET /watchlists
  def index
    @watchlists = Watchlist.all
  end

  # GET /watchlists/1
  def show
  end

  # GET /watchlists/new
  def new
    @watchlist = Watchlist.new
  end

  # GET /watchlists/1/edit
  def edit
  end

  # POST /watchlists
  def create
    @watchlist = Watchlist.new(watchlist_params)

    if @watchlist.save
      redirect_to @watchlist, notice: "Watchlist was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /watchlists/1
  def update
    if @watchlist.update(watchlist_params)
      redirect_to @watchlist, notice: "Watchlist was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /watchlists/1
  def destroy
    @watchlist.destroy
    redirect_to watchlists_url, notice: "Watchlist was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_watchlist
      @watchlist = Watchlist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def watchlist_params
      params.require(:watchlist).permit(:user_id, :watchlist_type, :rating, :watchable_id, :watchable_type)
    end
end
