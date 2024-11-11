class BandsController < ApplicationController



  def index
    # Check if the 'local' filter is applied
    if params[:local] == "1"  # If the checkbox is checked
      @bands = Band.where(local: true)  # Only local bands
    else
      @bands = Band.all  # All bands if no filter is applied
    end
  end

  def show
    @band = Band.find_by(id: params[:id])
    if @band.nil?
      redirect_to bands_path, alert: "Band not found."
    end
  end


  # GET /bands/new
  def new
    @genres = load_genres
    @band = Band.new
  end

  # GET /bands/1/edit
  def edit
    @band = Band.find(params[:id])
    @genres = load_genres
  end

  # POST /bands or /bands.json
  def create
    @band = Band.new(params[:id])
    @genres = load_genres
    

    respond_to do |format|
      if @band.save
        format.html { redirect_to @band, notice: 'Band was successfully created.' }
        format.json { render :show, status: :created, location: @band }
      else
        format.html { render :new }
        format.json { render json: @band.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bands/1 or /bands/1.json
  def update
    respond_to do |format|
      @band = Band.find(params[:id])
      if @band.update(band_params)
        format.html { redirect_to @band, notice: 'Band was successfully updated.' }
        format.json { render :show, status: :ok, location: @band }
      else
        format.html { render :edit }
        format.json { render json: @band.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bands/1 or /bands/1.json
  def destroy
    @band = Band.find(params[:id])
    @band.destroy
    respond_to do |format|
      format.html { redirect_to bands_url, notice: 'Band was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def load_genres
      genres_file = Rails.root.join('config', 'genres.json')
      JSON.parse(File.read(genres_file))["genres"]
    end

    def set_band
      @band = Band.find(params[:id])
    end

    
    def band_params
      params.require(:band).permit(:band_name, :genre, :band_description, :band_bandcamp_link, :band_instagram_link, :band_email, :band_location, :band_ffo, :profile_picture)
    end

    end
