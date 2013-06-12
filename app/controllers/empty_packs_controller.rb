class EmptyPacksController < ApplicationController
	def index
		@producerRut = params[:producer_rut]
  	end
end
