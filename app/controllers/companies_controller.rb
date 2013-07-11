#encoding: utf-8
class CompaniesController < ApplicationController
  load_and_authorize_resource
  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @companies }
    end
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    @company = Company.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @company }
    end
  end

  # GET /companies/new
  # GET /companies/new.json
  def new
    @company = Company.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @company }
    end
  end

  # GET /companies/1/edit
  def edit
    @company = Company.find(params[:id])
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(params[:company])
    if @company.active == nil
       @company.active = false
    end
    if(@company.system_type == true)
      role = Role.new(:name => "Administador de Acopio", :description => "Usado para administar compañias de acopio")
      a=AccessRight.create(:model_name => "User", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "Company", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "AccessRight", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "Commune", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "Destination", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "Dispatch", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "Grouping", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "Kind", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "Locality", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "PackGroupDispatch", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "PackGroupReceipt", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "PackType", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "Pallet", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "Producer", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "Quality", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "Receipt", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "Region", :action => "read")
      role.access_rights << a
      a=AccessRight.create(:model_name => "Season", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "Variety", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "User", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "Role", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "GroupingsProducer", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "Container", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "Setting", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "WikiPage", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "WikiPageVersion", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "DispatchContainer", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "EmptyPacksDestinationMove", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "EmptyPacksProducerMove", :action => "manage")
      role.access_rights << a
    else
      role = Role.new(:name => "Administador de Packing", :description => "Usado para administar compañias de Packing")
      a=AccessRight.create(:model_name => "User", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "Company", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "AccessRight", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "Commune", :action => "manage")
      role.access_rights << a

      a=AccessRight.create(:model_name => "Grouping", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "Kind", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "Locality", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "PackGroupDispatch", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "PackGroupReceipt", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "PackType", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "Producer", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "Quality", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "Region", :action => "read")
      role.access_rights << a

      a=AccessRight.create(:model_name => "Variety", :action => "manage")
      role.access_rights << a

      a=AccessRight.create(:model_name => "Role", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "GroupingsProducer", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "Container", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "Setting", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "WikiPage", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "WikiPageVersion", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "DispatchContainer", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "EmptyPacksDestinationMove", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "EmptyPacksProducerMove", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "Supply", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "SuppliesLoan", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "SuppliesReturn", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "SuppliesProdiversLoan", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "Provider", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "Worker", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "PackingProcess", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "ReceiptPackingIo", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "StabilizationChamberIo", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "FrozenTunnelIo", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "TransitChamberIo", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "ProductionProcessIo", :action => "manage")
      role.access_rights << a

      a=AccessRight.create(:model_name => "SubProcess", :action => "manage")
      role.access_rights << a

      a=AccessRight.create(:model_name => "SubProcessIo", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "DispatchIo", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "PackPacking", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "FormatPacking", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "PackingPallet", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "PalletFinishedProduct", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "Custom", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "FinalPackingPallet", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "OriginPort", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "DestinationPort", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "StoreFinishProduct", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "CustomAgent", :action => "manage")
      role.access_rights << a
      a=AccessRight.create(:model_name => "ChargingOrder", :action => "manage")
      role.access_rights << a

      role1 = Role.new(:name => "Manejo de inventario", :description => "Usado para administar El inventario")
      a=AccessRight.create(:model_name => "Supply", :action => "manage")
      role1.access_rights << a
      a=AccessRight.create(:model_name => "Provider", :action => "manage")
      role1.access_rights << a
      a=AccessRight.create(:model_name => "SuppliesLoan", :action => "manage")
      role1.access_rights << a
      a=AccessRight.create(:model_name => "SuppliesReturn", :action => "manage")
      role1.access_rights << a
      a=AccessRight.create(:model_name => "SuppliesProdiversLoan", :action => "manage")
      role1.access_rights << a


    end
    respond_to do |format|
      if @company.save
        role.company_id = @company.id
        role.save
        role1.company_id = @company.id
        role1.save
        format.html { redirect_to @company, notice: 'La compania fue creada exitosamente.' }
        format.json { render json: @company, status: :created, location: @company }
      else
        format.html { render action: "new" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /companies/1
  # PUT /companies/1.json
  def update
    @company = Company.find(params[:id])

    respond_to do |format|
      if @company.update_attributes(params[:company])
        format.html { redirect_to @company, notice: 'La compania fue editada correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def disable
    if current_user.super_admin == true
      @company = Company.find(params[:id])
      @company.update_attribute(:active, false)
      
      User.where(:company_id => params[:id]).each{ |u|
        u.active = false
        u.save
      }
    end
    
  
    respond_to do |format|
      format.html { redirect_to companies_url }
      format.json { head :no_content }
    end
  end

  def enable
   if current_user.super_admin == true
      @company = Company.find(params[:id])
      @company.update_attribute(:active, true)
      
      User.where(:company_id => params[:id]).each{ |u|
        u.active = true
        u.save
      }
    end
    
  
    respond_to do |format|
      format.html { redirect_to companies_url }
      format.json { head :no_content }
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
   if current_user.super_admin == true
      @company = Company.find(params[:id])
      @company.destroy
    end
    
    respond_to do |format|
      format.html { redirect_to companies_url }
      format.json { head :no_content }
    end
  end


end
