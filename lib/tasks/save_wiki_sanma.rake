#encoding: utf-8
namespace :save_wiki_sanma do
	desc "Guarda el estado de la wiki del equipo de sanma"
    task :load => :environment do
    	wikis = WikiPage.where(:creator_id => 4)
    	File.open("lib/tasks/init_wiki_sanma.rake", "w") { |file| 

    		file.write("#encoding: utf-8\n")
    		file.write("namespace :init_wiki_sanma do\n")
    		file.write("	desc 'inicializa la wiki'\n")
    		file.write("	task :load, [:delete] => :environment do |t, args|\n")
    		file.write("		if :delete != false\n")
            file.write("        	WikiPage.delete_all\n")
            file.write("        end\n")
    		wikis.each do |wiki|
    			file.write("		WikiPage.create(:creator_id => 4, :updator_id => 4, 
    				:path=> '#{wiki.path}', :title => '#{wiki.title}', :content => '#{wiki.content}')\n")
    		end


    		file.write("	end\n")
    		file.write("end\n")
    	}
    end
end