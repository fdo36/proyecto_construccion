class DispatchIosController < ApplicationController
  # GET /dispatch_ios
  # GET /dispatch_ios.json
  def index
    @dispatch_ios = DispatchIo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dispatch_ios }
    end
  end

  # GET /dispatch_ios/1
  # GET /dispatch_ios/1.json
  def show
    @dispatch_io = DispatchIo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dispatch_io }
    end
  end

  # GET /dispatch_ios/new
  # GET /dispatch_ios/new.json
  def new
    @dispatch_io = DispatchIo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dispatch_io }
    end
  end

  # GET /dispatch_ios/1/edit
  def edit
    @dispatch_io = DispatchIo.find(params[:id])
  end

  # POST /dispatch_ios
  # POST /dispatch_ios.json
  def create
    @dispatch_io = DispatchIo.new(params[:dispatch_io])

    respond_to do |format|
      if @dispatch_io.save
        format.html { redirect_to @dispatch_io, notice: 'Dispatch io was successfully created.' }
        format.json { render json: @dispatch_io, status: :created, location: @dispatch_io }
      else
        format.html { render action: "new" }
        format.json { render json: @dispatch_io.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dispatch_ios/1
  # PUT /dispatch_ios/1.json
  def update
    @dispatch_io = DispatchIo.find(params[:id])

    respond_to do |format|
      if @dispatch_io.update_attributes(params[:dispatch_io])
        format.html { redirect_to @dispatch_io, notice: 'Dispatch io was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dispatch_io.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dispatch_ios/1
  # DELETE /dispatch_ios/1.json
  def destroy
    @dispatch_io = DispatchIo.find(params[:id])
    @dispatch_io.destroy

    respond_to do |format|
      format.html { redirect_to dispatch_ios_url }
      format.json { head :no_content }
    end
  end
end
