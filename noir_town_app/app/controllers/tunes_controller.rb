class TunesController < ApplicationController
  before_action :set_tune, only: [:show, :edit, :update, :destroy]

  # GET /tunes
  def index
    # Sort tunes by all fields.
    @tunes = Tune.all
    @sort = params[:sort] || session[:sort]
    session[:sort] = @sort
    @tunes = Tune.all.order(@sort)
      
    # Search tunes by any selected field.
    @search = params[:search] || session[:search]
    @option = params[:option] || session[:option]
    session[:search] = @search
    session[:option] = @option
    case @option.to_i
    when 1
       @tunes = query("title", @search, @sort) 
    when 2
       @tunes = query("artist", @search, @sort) 
    when 3
       @tunes = query("album", @search, @sort) 
    end
  end
   
  # Function to specify a field and value for search box.
  def query(field, value, sort)
    Tune.where(["LOWER(#{field}) LIKE?", "%#{value.downcase}%"]).order(sort) 
  end

  # GET /tunes/1
  def show
  end

  # GET /tunes/new
  def new
    @tune = Tune.new
  end

  # GET /tunes/1/edit
  def edit
  end

  # POST /tunes
  def create
    @tune = Tune.new(tune_params)

    if @tune.save and not @tune.nil?
      redirect_to tunes_url, notice: "#{@tune.title} was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /tunes/1
  def update
    if @tune.update(tune_params) and not @tune.nil?
      redirect_to tunes_url, notice: "#{@tune.title} was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /tunes/1
  def destroy
    @tune = Tune.find(params[:id])
    @tune.destroy  
    redirect_to tunes_url, notice: "Tune was removed."
  end
    
  # Function to find an artist of a tune.
  def find_artist
    @tune = Tune.find(params[:id])
    @artist = @tune.artist  
    # Display tunes by artist if exists.
    if !@artist.blank?
      @tunes_by_artist = Tune.get_artist(@artist)
    else 
      redirect_to tunes_url, notice: "'#{@tune.title}' has no artist info"
    end
  end

  private
    def set_tune
      @tune = Tune.find(params[:id])
    end
    def tune_params
      params.require(:tune).permit(:title, :artist, :album, :description, :release_date, :url)
    end
end
