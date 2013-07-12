class EmptyPacksController < ApplicationController
	def index
		@producerRut = params[:producer_rut]
		@last_move=EmptyPacksProducerMove.find(:all, :order => "id desc", :limit => 1).reverse
  		@code = @last_move.map{ |x| x.code }
  		@id = @last_move.map{ |x| x.id }

  		@last_move_destination=EmptyPacksDestinationMove.find(:all, :order => "id desc", :limit => 1).reverse
  		@code_destination = @last_move_destination.map{ |x| x.code }
  		@id_destination = @last_move_destination.map{ |x| x.id }
  	end
end
