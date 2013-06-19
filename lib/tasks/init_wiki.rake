#encoding: utf-8
namespace :init_wiki do
	desc 'junta toda la wiki'
	task :load => :environment do
        WikiPage.delete_all
		#Rake::Task['init_wiki_felipe:load'].invoke(false)
		Rake::Task['init_wiki_fernando:load'].invoke(false)
		#Rake::Task['init_wiki_sanma:load'].invoke(false)
		#Rake::Task['init_wiki_mary:load'].invoke(false)
	end
end