class RolesController < ApplicationController
  load_and_authorize_resource
  # GET /roles
  # GET /roles.json
  def index
    @company = Company.find(params[:company_id])
    @roles = Role.where(:company_id => @company.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @roles }
    end
  end

  # GET /roles/1
  # GET /roles/1.json
  def show
    @company = Company.find(params[:company_id])
    @role = Role.find(params[:id])
    if current_user.super_admin == true
      @supported_models = Astrotils::get_models_name.map{ |model_name|
        begin
          c = Object.const_get(model_name)  
          [c.model_name.human, model_name]
        rescue
          nil
        end
      }
      @supported_models.reject! {|pair| pair == nil}
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @role }
      end
    else
      @supported_models = []
      @supported_access_right = []
      Role.where(:company_id => @company.id).map{ |r|
      #for r in current_user.roles
        #if r.company_id == @company.id
          r.access_rights.each do |ar|
            @supported_models << [ar.model_name , ar.action]
            @supported_access_right << ar.action
          end
        #end
      #end
      }
    end
  end

  # GET /roles/new
  # GET /roles/new.json
  def new
    @company = Company.find(params[:company_id])
    @role = Role.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @role }
    end
  end

  # GET /roles/1/edit
  def edit
    @company = Company.find(params[:company_id])
    @role = Role.find(params[:id])
  end

  # POST /roles
  # POST /roles.json
  def create
    @company = Company.find(params[:company_id])
    @role = Role.new(params[:role])
    @role.company_id = @company.id
    respond_to do |format|
      if @role.save
        format.html { redirect_to company_role_path(@company, @role), notice: 'El rol fue creado exitosamente.' }
        format.json { render json: @role, status: :created, location: @role }
      else
        format.html { render action: "new" }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /roles/1
  # PUT /roles/1.json
  def update
    @company = Company.find(params[:company_id])
    @role = Role.find(params[:id])

    respond_to do |format|
      if @role.update_attributes(params[:role])
        format.html { redirect_to company_role_path(@company, @role), notice: 'El rol fue editado exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    @company = Company.find(params[:company_id])
    @role = Role.find(params[:id])
    @users = User.where(:company_id => @company.id)

    exist_rol_in_user = false
    for u in @users 
      for r in u.roles
        if r==@role
          #no se puede eliminar
          exist_rol_in_user = true
        end
      end 
    end

    if !exist_rol_in_user
      @role.destroy
    end

    respond_to do |format|
      format.html { redirect_to company_roles_path(@company) }
      format.json { head :no_content }
    end
  end
end
