class AccessRightsController < ApplicationController
  # GET /access_rights
  # GET /access_rights.json
  def index
    @access_rights = AccessRight.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @access_rights }
    end
  end

  # GET /access_rights/1
  # GET /access_rights/1.json
  def show
    @access_right = AccessRight.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @access_right }
    end
  end

  # GET /access_rights/new
  # GET /access_rights/new.json
  def new
    @access_right = AccessRight.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @access_right }
    end
  end

  # GET /access_rights/1/edit
  def edit
    @access_right = AccessRight.find(params[:id])
  end

  # POST /access_rights
  # POST /access_rights.json
  def create
    @access_right = AccessRight.new(params[:access_right])

    respond_to do |format|
      if @access_right.save
        format.html { redirect_to @access_right, notice: 'Access right was successfully created.' }
        format.json { render json: @access_right, status: :created, location: @access_right }
      else
        format.html { render action: "new" }
        format.json { render json: @access_right.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /access_rights/1
  # PUT /access_rights/1.json
  def update
    @access_right = AccessRight.find(params[:id])

    respond_to do |format|
      if @access_right.update_attributes(params[:access_right])
        format.html { redirect_to @access_right, notice: 'Access right was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @access_right.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /access_rights/1
  # DELETE /access_rights/1.json
  def destroy
    @access_right = AccessRight.find(params[:id])
    @access_right.destroy

    respond_to do |format|
      format.html { redirect_to access_rights_url }
      format.json { head :no_content }
    end
  end
end
