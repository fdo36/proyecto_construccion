class DispatchContainersController < ApplicationController
  # GET /dispatch_containers
  # GET /dispatch_containers.json
  def index
    @dispatch_containers = DispatchContainer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dispatch_containers }
    end
  end

  # GET /dispatch_containers/1
  # GET /dispatch_containers/1.json
  def show
    @dispatch_container = DispatchContainer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dispatch_container }
    end
  end

  # GET /dispatch_containers/new
  # GET /dispatch_containers/new.json
  def new
    @dispatch_container = DispatchContainer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dispatch_container }
    end
  end

  # GET /dispatch_containers/1/edit
  def edit
    @dispatch_container = DispatchContainer.find(params[:id])
  end

  # POST /dispatch_containers
  # POST /dispatch_containers.json
  def create
    @dispatch_container = DispatchContainer.new(params[:dispatch_container])

    respond_to do |format|
      if @dispatch_container.save
        format.html { redirect_to @dispatch_container, notice: 'Dispatch container was successfully created.' }
        format.json { render json: @dispatch_container, status: :created, location: @dispatch_container }
      else
        format.html { render action: "new" }
        format.json { render json: @dispatch_container.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dispatch_containers/1
  # PUT /dispatch_containers/1.json
  def update
    @dispatch_container = DispatchContainer.find(params[:id])

    respond_to do |format|
      if @dispatch_container.update_attributes(params[:dispatch_container])
        format.html { redirect_to @dispatch_container, notice: 'Dispatch container was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dispatch_container.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dispatch_containers/1
  # DELETE /dispatch_containers/1.json
  def destroy
    @dispatch_container = DispatchContainer.find(params[:id])
    @dispatch_container.destroy

    respond_to do |format|
      format.html { redirect_to dispatch_containers_url }
      format.json { head :no_content }
    end
  end
end
