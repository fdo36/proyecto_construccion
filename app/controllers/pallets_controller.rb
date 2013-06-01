class PalletsController < ApplicationController
  #load_and_authorize_resource
  # GET /pallets
  # GET /pallets.json
  def index
    @pallets = Pallet.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pallets }
    end
  end

  # GET /pallets/1
  # GET /pallets/1.json
  def show
    @pallet = Pallet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pallet }
    end
  end

  # GET /pallets/new
  # GET /pallets/new.json
  def new
    @receipt = nil
    if params.has_key?(:receipt_id)
      @receipt = Receipt.find(params[:receipt_id])
    else
      @dispatch = Dispatch.find(params[:dispatch_id])
    end

    if @receipt == nil
      @pallet = @dispatch.pallets.build
    else
      @pallet = @receipt.pallets.build   
    end
    respond_to do |format|
      format.html {
        if @receipt == nil
          render 'newD'
        end
      }
      format.json { render json: @pallet }
    end
  end

  # GET /pallets/1/edit
  def edit
    @pallet = Pallet.find(params[:id])
  end

  # POST /pallets
  # POST /pallets.json
  def create
    @receipt = nil
    if params.has_key?(:receipt_id)
      @receipt = Receipt.find(params[:receipt_id])
    else
      @dispatch = Dispatch.find(params[:dispatch_id])
    end

    if @receipt == nil
      @pallet = @dispatch.pallets.create(params[:pallet])
    else
      @pallet = @receipt.pallets.create(params[:pallet])
    end

    @pallet.company_id = current_user.company_id
    respond_to do |format|
      if @pallet.save
        format.html { 
          if @receipt == nil
            redirect_to dispatch_path(@dispatch) 
          else
            redirect_to receipt_path(@receipt)   
          end
        } 
        format.json { render json: @pallet, status: :created, location: @pallet }
      else
        format.html { 
          if @receipt == nil
            render action: "newD"
          else
            render action: "new"
          end
          }
        format.json { render json: @pallets.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pallets/1
  # PUT /pallets/1.json
  def update
    @pallet = Pallet.find(params[:id])

    respond_to do |format|
      if @pallet.update_attributes(params[:pallet])
        format.html { redirect_to @pallet, notice: 'Pallet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pallet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pallets/1
  # DELETE /pallets/1.json
  def destroy
    @pallet = Pallet.find(params[:id])
    @pallet.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
end
  