class WikiPagesController < ApplicationController
	load_and_authorize_resource

  	acts_as_wiki_pages_controller  
end
