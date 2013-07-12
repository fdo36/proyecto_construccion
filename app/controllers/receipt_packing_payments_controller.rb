class ReceiptPackingPaymentsController < ApplicationController
  # GET /receipt_packing_ios
  # GET /receipt_packing_ios.json
  def index
    @receipt_packing_ios = ReceiptPackingIo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @receipt_packing_ios }
    end
  end

  def pay
    @receipt_packing_io = ReceiptPackingIo.find(params[:id])
    mtrxx = []
    # PREPARACION DATOS PARA REPORTE
    @pallets = PackingPallet.find(:all,
                  :from => 'packing_pallets',
                  :select => 'packing_pallets.pallet_code,
                              packing_pallets.gross_weight,
                              packing_pallets.variety_id,
                              packing_pallets.unit_price,
                              packing_pallets.pack_type_id,
                              packing_pallets.tare,
                              packing_pallets.quantity',
                  :conditions => ['packing_pallets.receipt_packing_io_id=?',
                  @receipt_packing_io.id])
    
    @pallets.each do |pallet|
      row = []
      row << pallet.pallet_code
      
      row << "ERROR"
      @packtype = PackType.find(pallet.pack_type_id)
      pesoNeto = pallet.gross_weight - pallet.tare - @packtype.tare * pallet.quantity
      row << pesoNeto
      row << pallet.unit_price
      row << (pesoNeto * pallet.unit_price).to_i
      mtrxx << row
    end
    puts mtrxx.length

    pdf = Report10Pdf.new(@receipt_packing_io,mtrxx, view_context)
        send_data pdf.render,
        type: "application/pdf",
        disposition: "inline"

    @receipt_packing_io.update_attribute(:paid, "true")
    time2 = DateTime.current()
    @receipt_packing_io.update_attribute(:payment_date, time2)
    @receipt_packing_io.update_attribute(:editable, "false")

  end  
end
