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
    @role = Role.find(params[:role_id])
    @access_right = @role.access_rights.create(params[:access_right])
    redirect_to role_path(@role)
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
    @role = Role.find(params[:role_id])
    @access_right = @role.access_rights.find(params[:id])
    @access_right.destroy
    redirect_to role_path(@role)
  end
end
