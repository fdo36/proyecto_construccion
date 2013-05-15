class SeasonsController < ApplicationController
  # GET /seasons
  # GET /seasons.json
  def index
    @season = Season.new
    @seasons = Season.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @seasons }
    end
  end

  # GET /seasons/1
  # GET /seasons/1.json
  def show
    @season = Season.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @season }
    end
  end

  # GET /seasons/new
  # GET /seasons/new.json
  def new
    @season = Season.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @season }
    end
  end

  # GET /seasons/1/edit
  def edit
    @season = Season.find(params[:id])
  end



  # POST /seasons
  # POST /seasons.json
  def create
    @season = Season.new(params[:season])
    @season.update_attributes(:is_active => "1", :is_delete => "0")

    respond_to do |format|
      if @season.save
        format.html { redirect_to @season, notice: 'Season was successfully created.' }
        format.json { render json: @season, status: :created, location: @season }
      else
        format.html { render action: "new" }
        format.json { render json: @season.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /seasons/1
  # PUT /seasons/1.json
  def update
    @season = Season.find(params[:id])

    respond_to do |format|
      if @season.update_attributes(params[:season])
        format.html { redirect_to @season, notice: 'Season was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @season.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seasons/1
  # DELETE /seasons/1.json
  def destroy
    @season = Season.find(params[:id])
    @season.destroy

    respond_to do |format|
      format.html { redirect_to seasons_url }
      format.json { head :no_content }
    end
  end


  def disable
    @season = Season.find(params[:id])
    @season.update_attribute(:is_active, "0")
    time2 = Time.now.strftime("%Y-%m-%d")
    @season.update_attribute(:end_date, time2)

    respond_to do |format|
      format.html { redirect_to seasons_url }
      format.json { head :no_content }
    end
  end

  def enable
    @season = Season.find(params[:id])
    @season.update_attribute(:is_active, "1")
    time2 = Time.now.strftime("%Y-%m-%d")
    @season.update_attribute(:init_date, time2)
    respond_to do |format|
      format.html { redirect_to seasons_url }
      format.json { head :no_content }
    end
  end

  def delete_season
    @season = Season.find(params[:id])
    @season.update_attribute(:is_delete, "1")
    respond_to do |format|
      format.html { redirect_to seasons_url }
      format.json { head :no_content }
    end
  end
  
end
