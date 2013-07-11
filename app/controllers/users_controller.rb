#encoding: utf-8
class UsersController < ApplicationController
  load_and_authorize_resource
  # GET /users
  # GET /users.json
  def index
    
    @company = Company.find(params[:company_id])
    if !can?(:manage, @company)
      raise CanCan::AccessDenied.new("Usted no puede administrar otra compañia", :manage, @company)
    end
      
    if current_user.super_admin == true
      @users = User.where(:company_id => params[:company_id])
    else
      @users = User.where(:company_id => current_user.company_id)
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @company = Company.find(params[:company_id])
    if !can?(:manage, @company)
      raise CanCan::AccessDenied.new("Usted no puede administrar otra compañia", :manage, @company)
    end
    
    @user = User.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def show_user
    @company = Company.find(params[:company_id]) 
    @user = User.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end    
  end

  def edit_user
    @company = Company.find(params[:company_id])
    @user = User.find(params[:id]) 
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @company = Company.find(params[:company_id])
    if !can?(:manage, @company)
      raise CanCan::AccessDenied.new("Usted no puede administrar otra compañia", :manage, @company)
    end
    @user = User.new
    @roles = Role.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @company = Company.find(params[:company_id])
    if !can?(:manage, @company)
      raise CanCan::AccessDenied.new("Usted no puede administrar otra compañia", :manage, @company)
    end
    @user = User.find(params[:id])
    @roles = Role.all
    @user.role_ids = params[:role_ids] if params[:role_ids]
  end

  # POST /users
  # POST /users.json
  def create
    @company = Company.find(params[:company_id])
    if !can?(:manage, @company)
      raise CanCan::AccessDenied.new("Usted no puede administrar otra compañia", :manage, @company)
    end
    @user = User.new(params[:user])
    @roles = Role.all
    role_ids = params[:role_ids] if params[:role_ids] 
    role_ids ||= []
    @user.role_ids = role_ids
    @user.company_id = @company.id
    
    if !current_user.super_admin
      @user.super_admin = false
    end
    
    respond_to do |format|
      if @user.save
        format.html { redirect_to company_users_path(@company), notice: 'El usuario fue creado exitosamente.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @company = Company.find(params[:company_id])
    if !can?(:manage, @company)
      raise CanCan::AccessDenied.new("Usted no puede administrar otra compañia", :manage, @company)
    end
    @user = User.find(params[:id])
    @roles = Role.all
    if !params.has_key?(:password_only)
      role_ids = params[:role_ids] if params[:role_ids]
      role_ids ||= []
      @user.role_ids = role_ids
    end

    respond_to do |format|
      if @user.update_attributes(params[:user])
        if params.has_key?(:password_only)
          format.html { redirect_to show_user_profile_path(@company, @user), notice: 'El perfil fue editado exitosamente.' }
          format.json { head :no_content }
        else          
          format.html { redirect_to company_user_path(@company, @user), notice: 'El usuario fue editado exitosamente.' }
          format.json { head :no_content }
        end
      else
        if !params.has_key?(:password_only)
            format.html { render action: "edit" }
        else
            format.html { render action: "edit_password" }
        end
        
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit_password
    @user = User.find(params[:id])
    @company = Company.find(params[:company_id])
    respond_to do |format|
        format.html
        format.json { head :no_content }
    end
  end
  
  def disable
    @company = Company.find(params[:company_id])
    if !can?(:manage, @company)
      raise CanCan::AccessDenied.new("Usted no puede administrar otra compañia", :manage, @company)
    end
    @user = User.find(params[:id])
    
    if ((!@user.super_admin && @user.company_id == @current_user.company_id && can?(:manage, User)) ||
      current_user.super_admin)
        @user.update_attribute(:active, false)
    end

    respond_to do |format|
      format.html { redirect_to company_users_path(@company) }
      format.json { head :no_content }
    end
  end

  def enable
    @company = Company.find(params[:company_id])
    if !can?(:manage, @company)
      raise CanCan::AccessDenied.new("Usted no puede administrar otra compañia", :manage, @company)
    end
    @user = User.find(params[:id])
    
    if ((!@user.super_admin && @user.company_id == @current_user.company_id && can?(:manage, User)) ||
      current_user.super_admin)
        @user.update_attribute(:active, true)
    end

    respond_to do |format|
      format.html { redirect_to company_users_path(@company) }
      format.json { head :no_content }
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @company = Company.find(params[:company_id])
    if !can?(:manage, @company)
      raise CanCan::AccessDenied.new("Usted no puede administrar otra compañia", :manage, @company)
    end
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to company_users_path(@company) }
      format.json { head :no_content }
    end
  end
end
