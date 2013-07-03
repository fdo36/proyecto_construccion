class SuppliesProvidersLoansController < ApplicationController
  # GET /supplies_providers_loans
  # GET /supplies_providers_loans.json
  def index
    @supplies_providers_loans = SuppliesProvidersLoan.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @supplies_providers_loans }
    end
  end

  # GET /supplies_providers_loans/1
  # GET /supplies_providers_loans/1.json
  def show
    @supplies_providers_loan = SuppliesProvidersLoan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @supplies_providers_loan }
    end
  end

  # GET /supplies_providers_loans/new
  # GET /supplies_providers_loans/new.json
  def new
    @supplies_providers_loan = SuppliesProvidersLoan.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @supplies_providers_loan }
    end
  end

  # GET /supplies_providers_loans/1/edit
  def edit
    @supplies_providers_loan = SuppliesProvidersLoan.find(params[:id])
  end

  # POST /supplies_providers_loans
  # POST /supplies_providers_loans.json
  def create
    @supplies_providers_loan = SuppliesProvidersLoan.new(params[:supplies_providers_loan])

    respond_to do |format|
      if @supplies_providers_loan.save
        format.html { redirect_to @supplies_providers_loan, notice: 'Supplies providers loan was successfully created.' }
        format.json { render json: @supplies_providers_loan, status: :created, location: @supplies_providers_loan }
      else
        format.html { render action: "new" }
        format.json { render json: @supplies_providers_loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /supplies_providers_loans/1
  # PUT /supplies_providers_loans/1.json
  def update
    @supplies_providers_loan = SuppliesProvidersLoan.find(params[:id])

    respond_to do |format|
      if @supplies_providers_loan.update_attributes(params[:supplies_providers_loan])
        format.html { redirect_to @supplies_providers_loan, notice: 'Supplies providers loan was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @supplies_providers_loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supplies_providers_loans/1
  # DELETE /supplies_providers_loans/1.json
  def destroy
    @supplies_providers_loan = SuppliesProvidersLoan.find(params[:id])
    @supplies_providers_loan.destroy

    respond_to do |format|
      format.html { redirect_to supplies_providers_loans_url }
      format.json { head :no_content }
    end
  end
end
