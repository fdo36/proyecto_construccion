class PackGroupDispatchesController < ApplicationController
  # GET /pack_group_dispatches
  # GET /pack_group_dispatches.json
  def index
    @pack_group_dispatches = PackGroupDispatch.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pack_group_dispatches }
    end
  end

  # GET /pack_group_dispatches/1
  # GET /pack_group_dispatches/1.json
  def show
    @pack_group_dispatch = PackGroupDispatch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pack_group_dispatch }
    end
  end

  # GET /pack_group_dispatches/new
  # GET /pack_group_dispatches/new.json
  def new
    @pack_group_dispatch = PackGroupDispatch.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pack_group_dispatch }
    end
  end

  # GET /pack_group_dispatches/1/edit
  def edit
    @pack_group_dispatch = PackGroupDispatch.find(params[:id])
  end

  # POST /pack_group_dispatches
  # POST /pack_group_dispatches.json
  def create
    @pack_group_dispatch = PackGroupDispatch.new(params[:pack_group_dispatch])

    respond_to do |format|
      if @pack_group_dispatch.save
        format.html { redirect_to @pack_group_dispatch, notice: 'Pack group dispatch was successfully created.' }
        format.json { render json: @pack_group_dispatch, status: :created, location: @pack_group_dispatch }
      else
        format.html { render action: "new" }
        format.json { render json: @pack_group_dispatch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pack_group_dispatches/1
  # PUT /pack_group_dispatches/1.json
  def update
    @pack_group_dispatch = PackGroupDispatch.find(params[:id])

    respond_to do |format|
      if @pack_group_dispatch.update_attributes(params[:pack_group_dispatch])
        format.html { redirect_to @pack_group_dispatch, notice: 'Pack group dispatch was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pack_group_dispatch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pack_group_dispatches/1
  # DELETE /pack_group_dispatches/1.json
  def destroy
    @pack_group_dispatch = PackGroupDispatch.find(params[:id])
    @pack_group_dispatch.destroy

    respond_to do |format|
      format.html { redirect_to pack_group_dispatches_url }
      format.json { head :no_content }
    end
  end
end
