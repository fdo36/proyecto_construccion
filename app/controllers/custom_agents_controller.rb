class CustomAgentsController < ApplicationController
  # GET /custom_agents
  # GET /custom_agents.json
  def index
    @custom_agents = CustomAgent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @custom_agents }
    end
  end

  # GET /custom_agents/1
  # GET /custom_agents/1.json
  def show
    @custom_agent = CustomAgent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @custom_agent }
    end
  end

  # GET /custom_agents/new
  # GET /custom_agents/new.json
  def new
    @custom_agent = CustomAgent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @custom_agent }
    end
  end

  # GET /custom_agents/1/edit
  def edit
    @custom_agent = CustomAgent.find(params[:id])
  end

  # POST /custom_agents
  # POST /custom_agents.json
  def create
    @custom_agent = CustomAgent.new(params[:custom_agent])

    respond_to do |format|
      if @custom_agent.save
        format.html { redirect_to @custom_agent, notice: 'Custom agent was successfully created.' }
        format.json { render json: @custom_agent, status: :created, location: @custom_agent }
      else
        format.html { render action: "new" }
        format.json { render json: @custom_agent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /custom_agents/1
  # PUT /custom_agents/1.json
  def update
    @custom_agent = CustomAgent.find(params[:id])

    respond_to do |format|
      if @custom_agent.update_attributes(params[:custom_agent])
        format.html { redirect_to @custom_agent, notice: 'Custom agent was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @custom_agent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /custom_agents/1
  # DELETE /custom_agents/1.json
  def destroy
    @custom_agent = CustomAgent.find(params[:id])
    @custom_agent.destroy

    respond_to do |format|
      format.html { redirect_to custom_agents_url }
      format.json { head :no_content }
    end
  end
end
