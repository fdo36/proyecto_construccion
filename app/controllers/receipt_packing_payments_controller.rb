class ReceiptPackingPaymentsController < ApplicationController
  # GET /receipt_packing_ios
  # GET /receipt_packing_ios.json
  def index
    @receipt_packing_ios = ReceiptPackingIo.all
    @packing_pallets = PackingPallet.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @receipt_packing_ios }
    end
  end

  def pay
    @receipt_packing_io = ReceiptPackingIo.find(params[:id])
    @receipt_packing_io.update_attribute(:paid, "true")
    time2 = DateTime.current()
    @receipt_packing_io.update_attribute(:payment_date, time2)
    @receipt_packing_io.update_attribute(:editable, "false")
    respond_to do |format|
      format.html { redirect_to receipt_packing_payments_url }
      format.json { head :no_content }
    end
  end  
end
