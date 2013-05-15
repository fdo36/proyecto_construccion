class ProducersController < ApplicationController
  # GET /producers
  # GET /producers.json
  def index
    @producers = Producer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @producers }
    end
  end

  # GET /producers/1
  # GET /producers/1.json
  def show
    @producer = Producer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @producer }
    end
  end

  # GET /producers/new
  # GET /producers/new.json
  def new
    @producer = Producer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @producer }
    end
  end

  # GET /producers/1/edit
  def edit
    @producer = Producer.find(params[:id])
  end

  # POST /producers
  # POST /producers.json
  def create
    @producer = Producer.new(params[:producer])
    @producer.update_attributes(:active => "1", :is_deleted => "0")

    respond_to do |format|
      if @producer.save
        format.html { redirect_to @producer, notice: 'Producer was successfully created.' }
        format.json { render json: @producer, status: :created, location: @producer }
      else
        format.html { render action: "new" }
        format.json { render json: @producer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /producers/1
  # PUT /producers/1.json
  def update
    @producer = Producer.find(params[:id])

    respond_to do |format|
      if @producer.update_attributes(params[:producer])
        format.html { redirect_to @producer, notice: 'Producer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @producer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /producers/1
  # DELETE /producers/1.json
  def destroy
    @producer = Producer.find(params[:id])
    @producer.destroy

    respond_to do |format|
      format.html { redirect_to producers_url }
      format.json { head :no_content }
    end
  end

  def disable
    @producer = Producer.find(params[:id])
    @producer.update_attribute(:active, "0")

    respond_to do |format|
      format.html { redirect_to producers_url }
      format.json { head :no_content }
    end
  end

  def enable
    @producer = Producer.find(params[:id])
    @producer.update_attribute(:active, "1")
    respond_to do |format|
      format.html { redirect_to producers_url }
      format.json { head :no_content }
    end
  end

  def delete_producer
    @producer = Producer.find(params[:id])
    @producer.update_attribute(:is_delete, "1")
    respond_to do |format|
      format.html { redirect_to producers_url }
      format.json { head :no_content }
    end
  end
end
