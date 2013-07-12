class EmptyPacksProducerMovesController < ApplicationController
  # GET /empty_packs_producer_moves
  # GET /empty_packs_producer_moves.json
  def index
    @empty_packs_producer_moves = EmptyPacksProducerMove.where(:producer_id => params[:producer_id] )
    @producer = Producer.find(params[:producer_id])
    @pack_types = PackType.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @empty_packs_producer_moves }
    end
  end

  # GET /empty_packs_producer_moves/1
  # GET /empty_packs_producer_moves/1.json
  # GET /empty_packs_producer_moves/1.pdf funciona con cualquier id
  def show
    @empty_packs_producer_move = EmptyPacksProducerMove.find(params[:id])

    highest_id_execution = EmptyPacksProducerMove.find(:all, :order => "id desc", :limit => 1).reverse.first
    @empty_packs_producer = EmptyPacksProducerMove.find(highest_id_execution)
    @producer = Producer.find(@empty_packs_producer.producer_id)

    @data = EmptyPacksProducerMove.find_by_sql "
            SELECT ep.pack_option as optionP, ep.created_at as created, ep.quantity quantity,
            pt.name as nameP 
            FROM empty_packs_producer_moves as ep, pack_types as pt
            WHERE ep.code = #{@empty_packs_producer.code} and 
            ep.pack_type_id = pt.id
            "
    # cambiar ep.producer_id = #{@empty_packs_producer.producer_id} por 
    # ep.code = #{@empty_packs_producer.code}


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @data }
      format.pdf {
        pdf = EmptyProducerPdf.new(@producer, @data)
      send_data pdf.render,
      type: "application/pdf",
      disposition: "inline"}
    end
  end

  # GET /empty_packs_producer_moves/new
  # GET /empty_packs_producer_moves/new.json
  def new
    @empty_packs_producer_move = EmptyPacksProducerMove.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @empty_packs_producer_move }
    end
  end

  # GET /empty_packs_producer_moves/1/edit
  def edit
    @empty_packs_producer_move = EmptyPacksProducerMove.find(params[:id])
  end

  # POST /empty_packs_producer_moves
  # POST /empty_packs_producer_moves.json
  def create
    @empty_packs_producer_move = EmptyPacksProducerMove.new(params[:empty_packs_producer_move])
    @empty_packs_producer_move.company_id = current_user.company_id
    
    respond_to do |format|
      if @empty_packs_producer_move.save
        format.html { redirect_to @empty_packs_producer_move, notice: 'Empty packs producer move was successfully created.' }
        format.json { render json: @empty_packs_producer_move, status: :created, location: @empty_packs_producer_move }
      else
        format.html { render action: "new" }
        format.json { render json: @empty_packs_producer_move.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /empty_packs_producer_moves/1
  # PUT /empty_packs_producer_moves/1.json
  def update
    @empty_packs_producer_move = EmptyPacksProducerMove.find(params[:id])
    @producer = Producer.find(params[:producer_id])
    respond_to do |format|
      if @empty_packs_producer_move.update_attributes(params[:empty_packs_producer_move])
        format.html { redirect_to @empty_packs_producer_move, notice: 'Empty packs producer move was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @empty_packs_producer_move.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empty_packs_producer_moves/1
  # DELETE /empty_packs_producer_moves/1.json
  def destroy
    @producer = Producer.find(params[:producer_id])  
    @empty_packs_producer_move = EmptyPacksProducerMove.find(params[:id])
    @empty_packs_producer_move.destroy

    respond_to do |format|
      format.html { redirect_to producer_empty_packs_producer_moves_path(@producer) }
      format.json { head :no_content }
    end
  end
end
