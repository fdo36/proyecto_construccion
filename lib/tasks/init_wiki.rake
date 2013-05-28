#encoding: utf-8 
namespace :init_wiki do
	desc "TODO"
    task :load => :environment do
    	WikiPage.create(:creator_id => 1, :updator_id => 1, :path=>'', :title => "Ayuda sistema centros de acopio", :content => "h1. Este es el índice de la ayuda

* *Entradas/Salidas*

** [[Ingresos]]
** [[Temporadas]]
** [[Despachos]]
** [[Informes]]

* *Recursos*

** [[Productores]]
** [[Envases]]
** [[Destinos]]
** [[Especies]]
** [[Variedades]]
** [[Calidades]]
** [[Agrupaciones]]")
    end

end
