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


  def create
    respond_to do |format|
      @watchlist = current_user.watchlists.new(watchlist_params)  
        
      if @watchlist.save
        #format.html { redirect_to watchlist_url(@watchlist), notice: "Watchlist was successfully created." }
        #format.json { render :show, status: :created, location: @watchlist }
        format.turbo_stream  { render turbo_stream: turbo_stream.replace("#{helpers.dom_id @watchlist.movie}_watchlist_button",
          partial: 'watchlist_button', locals: {movie: @watchlist.movie}) }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @watchlist.errors, status: :unprocessable_entity }
      end
    end
  end


=begin  
  # POST /watchlists
  def create
    @watchlist = Watchlist.new(watchlist_params)

    if @watchlist.save
      redirect_to @watchlist, notice: "Watchlist was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end
=end

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
