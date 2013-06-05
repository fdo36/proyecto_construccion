namespace :save_wiki do
	desc "Guarda el estado de la wiki"
    task :load => :environment do
    	wikis = WikiPage.all
    	File.open("lib/tasks/init_wiki.rake", "w") { |file| 

    		file.write("#encoding: utf-8\n")
    		file.write("namespace :init_wiki do\n")
    		file.write("	desc 'inicializa la wiki'\n")
    		file.write("	task :load => :environment do\n")
            file.write("        WikiPage.delete_all\n")
    		wikis.each do |wiki|
    			file.write("		WikiPage.create(:creator_id => 1, :updator_id => 1, 
    				:path=> '#{wiki.path}', :title => '#{wiki.title}', :content => '#{wiki.content}')\n")
    		end


    		file.write("	end\n")
    		file.write("end\n")
    	}
    end
end