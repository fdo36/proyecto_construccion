class ReceiptContainersController < ApplicationController
  # GET /receipt_containers
  # GET /receipt_containers.json
  def index
    @receipt_containers = ReceiptContainer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @receipt_containers }
    end
  end

  # GET /receipt_containers/1
  # GET /receipt_containers/1.json
  def show
    @receipt_container = ReceiptContainer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @receipt_container }
    end
  end

  # GET /receipt_containers/new
  # GET /receipt_containers/new.json
  def new
    @receipt_container = ReceiptContainer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @receipt_container }
    end
  end

  # GET /receipt_containers/1/edit
  def edit
    @receipt_container = ReceiptContainer.find(params[:id])
  end

  # POST /receipt_containers
  # POST /receipt_containers.json
  def create
    @receipt_container = ReceiptContainer.new(params[:receipt_container])
    @receipt_container.company_id = current_user.company_id
    respond_to do |format|
      if @receipt_container.save
        format.html { redirect_to @receipt_container, notice: 'Receipt container was successfully created.' }
        format.json { render json: @receipt_container, status: :created, location: @receipt_container }
      else
        format.html { render action: "new" }
        format.json { render json: @receipt_container.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /receipt_containers/1
  # PUT /receipt_containers/1.json
  def update
    @receipt_container = ReceiptContainer.find(params[:id])

    respond_to do |format|
      if @receipt_container.update_attributes(params[:receipt_container])
        format.html { redirect_to @receipt_container, notice: 'Receipt container was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @receipt_container.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receipt_containers/1
  # DELETE /receipt_containers/1.json
  def destroy
    @receipt_container = ReceiptContainer.find(params[:id])
    @receipt_container.destroy

    respond_to do |format|
      format.html { redirect_to receipt_containers_url }
      format.json { head :no_content }
    end
  end
end
