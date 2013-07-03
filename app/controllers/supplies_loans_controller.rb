class SuppliesLoansController < ApplicationController
  # GET /supplies_loans
  # GET /supplies_loans.json
  def index
    @supplies_loans = SuppliesLoan.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @supplies_loans }
    end
  end

  # GET /supplies_loans/1
  # GET /supplies_loans/1.json
  def show
    @supplies_loan = SuppliesLoan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @supplies_loan }
    end
  end

  # GET /supplies_loans/new
  # GET /supplies_loans/new.json
  def new
    @supplies_loan = SuppliesLoan.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @supplies_loan }
    end
  end

  # GET /supplies_loans/1/edit
  def edit
    @supplies_loan = SuppliesLoan.find(params[:id])
  end

  # POST /supplies_loans
  # POST /supplies_loans.json
  def create
    @supplies_loan = SuppliesLoan.new(params[:supplies_loan])

    respond_to do |format|
      if @supplies_loan.save
        format.html { redirect_to @supplies_loan, notice: 'Supplies loan was successfully created.' }
        format.json { render json: @supplies_loan, status: :created, location: @supplies_loan }
      else
        format.html { render action: "new" }
        format.json { render json: @supplies_loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /supplies_loans/1
  # PUT /supplies_loans/1.json
  def update
    @supplies_loan = SuppliesLoan.find(params[:id])

    respond_to do |format|
      if @supplies_loan.update_attributes(params[:supplies_loan])
        format.html { redirect_to @supplies_loan, notice: 'Supplies loan was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @supplies_loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supplies_loans/1
  # DELETE /supplies_loans/1.json
  def destroy
    @supplies_loan = SuppliesLoan.find(params[:id])
    @supplies_loan.destroy

    respond_to do |format|
      format.html { redirect_to supplies_loans_url }
      format.json { head :no_content }
    end
  end
end
