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
    mtrxx = []

    # PREPARACION DATOS PARA REPORTE
    @pallet = PackingPallet.find{|p| p.receipt_packing_io_id == @receipt_packing_io.id}
    @packType = PackType.find(@receipt_packing_io.pack_type_id)
    @variety = Variety.find(@pallet.variety_id)  
    pesoNeto = @pallet.gross_weight - @pallet.tare - @packType.tare * @pallet.quantity


    mtrxx << @pallet.pallet_code
    mtrxx << @variety.name
    mtrxx << pesoNeto.to_i
    mtrxx << @pallet.unit_price
    mtrxx << (pesoNeto * @pallet.unit_price).to_i

    puts mtrxx
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
