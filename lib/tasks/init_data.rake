namespace :init_data do
  desc "TODO"
  task :load => :environment do
	for u in User.all
		u.roles.delete_all
	end
	User.delete_all
	Company.delete_all
	for r in Role.all
		r.access_rights.delete_all
	end
	Role.delete_all
	
	user = User.new(:email => "superadmin@acopio.com", :password => "12345678", :password_confirmation => "12345678", :super_admin => true)
	user.save(:validate => false)
	company = Company.new(:rut => "1111111-1", :name => "Dope Enterprise")
	company.save(:validate => false)
	role = Role.new(:name => "Rol de prueba", :description => "Usado para realizar pruebas", :company_id => company.id)
	role.save
	a=AccessRight.create(:model_name => "User", :action => "manage")
	role.access_rights << a
	a=AccessRight.create(:model_name => "Company", :action => "manage")
	role.access_rights << a
        a=AccessRight.create(:model_name => "AccessRight", :action => "manage")
        role.access_rights << a
        a=AccessRight.create(:model_name => "Commune", :action => "manage")
        role.access_rights << a
        a=AccessRight.create(:model_name => "Destination", :action => "manage")
        role.access_rights << a
        a=AccessRight.create(:model_name => "Dispatch", :action => "manage")
        role.access_rights << a
        a=AccessRight.create(:model_name => "Grouping", :action => "manage")
        role.access_rights << a
        a=AccessRight.create(:model_name => "Kind", :action => "manage")
        role.access_rights << a
        a=AccessRight.create(:model_name => "Locality", :action => "manage")
        role.access_rights << a
        a=AccessRight.create(:model_name => "PackGroupDispatch", :action => "manage")
        role.access_rights << a
        a=AccessRight.create(:model_name => "PackGroupReceipt", :action => "manage")
        role.access_rights << a
        a=AccessRight.create(:model_name => "PackType", :action => "manage")
        role.access_rights << a
        a=AccessRight.create(:model_name => "Pallet", :action => "manage")
        role.access_rights << a
        a=AccessRight.create(:model_name => "Producer", :action => "manage")
        role.access_rights << a
        a=AccessRight.create(:model_name => "Quality", :action => "manage")
        role.access_rights << a
        a=AccessRight.create(:model_name => "Receipt", :action => "manage")
        role.access_rights << a
        a=AccessRight.create(:model_name => "Region", :action => "read")
        role.access_rights << a
        a=AccessRight.create(:model_name => "Season", :action => "manage")
        role.access_rights << a
        a=AccessRight.create(:model_name => "Variety", :action => "manage")
        role.access_rights << a
        a=AccessRight.create(:model_name => "User", :action => "manage")
        role.access_rights << a

	user = User.new(:email => "admin@acopio.com", :password => "12345678", :password_confirmation => "12345678", :super_admin => false, :company_id => company.id)
	user.save(:validate => false)
	user.roles << role
  end

end
