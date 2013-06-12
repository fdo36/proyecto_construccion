class PackingProcessesController < ApplicationController
  # GET /packing_processes
  # GET /packing_processes.json
  def index
    @packing_processes = PackingProcess.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @packing_processes }
    end
  end

  # GET /packing_processes/1
  # GET /packing_processes/1.json
  def show
    @packing_process = PackingProcess.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @packing_process }
    end
  end

  # GET /packing_processes/new
  # GET /packing_processes/new.json
  def new
    @packing_process = PackingProcess.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @packing_process }
    end
  end

  # GET /packing_processes/1/edit
  def edit
    @packing_process = PackingProcess.find(params[:id])
  end

  # POST /packing_processes
  # POST /packing_processes.json
  def create
    @packing_process = PackingProcess.new(params[:packing_process])

    respond_to do |format|
      if @packing_process.save
        format.html { redirect_to @packing_process, notice: 'Packing process was successfully created.' }
        format.json { render json: @packing_process, status: :created, location: @packing_process }
      else
        format.html { render action: "new" }
        format.json { render json: @packing_process.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /packing_processes/1
  # PUT /packing_processes/1.json
  def update
    @packing_process = PackingProcess.find(params[:id])

    respond_to do |format|
      if @packing_process.update_attributes(params[:packing_process])
        format.html { redirect_to @packing_process, notice: 'Packing process was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @packing_process.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /packing_processes/1
  # DELETE /packing_processes/1.json
  def destroy
    @packing_process = PackingProcess.find(params[:id])
    @packing_process.destroy

    respond_to do |format|
      format.html { redirect_to packing_processes_url }
      format.json { head :no_content }
    end
  end
end
