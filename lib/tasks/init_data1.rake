#encoding: utf-8 
namespace :init_data1 do
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
  
  user = User.new(:email => "superadmin@acopio.com", :password => "12345678", :password_confirmation => "12345678", :super_admin => true, :active => true)
  user.save(:validate => false)
  company = Company.new(:rut => "1111111-1", :name => "Dope Enterprise", :active => true)
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
        a=AccessRight.create(:model_name => "Role", :action => "manage")
        role.access_rights << a

  user = User.new(:email => "admin@acopio.com", :password => "12345678", :password_confirmation => "12345678", :super_admin => false, :company_id => company.id, :active => true)
  user.save(:validate => false)
  user.roles << role

    c1 = Company.new(:rut => "2222222-2", :name => "Frutas Mella", :line_of_business => "Centro de Acopio",
        :commune_id => 121, :address => "San fernando sin numero", :email => "company1@frutas.cl", :active =>true, :phone => "073-2345687",
         )
    c1.save(:validate => false)

    c2 = Company.new(:rut => "11111111-1", :name => "Frutas Navarro", :line_of_business => "Centro de Acopio",
        :commune_id => 121, :address => "Santa fe 331",:active =>true, :email => "company2@frutas.cl", :phone => "073-2345687",
         )
    c2.save(:validate => false)

    c3 = Company.new(:rut => "33333333-3", :name => "Frutas Silva", :line_of_business => "Centro de Acopio",
        :commune_id => 120, :address => "Aguas Negras", :active =>true ,:email => "company3@frutas.cl", :phone => "075-23345687",
         )
    c3.save(:validate => false)

    c4 = Company.new(:rut => "44444444-4", :name => "Frutas Astroza", :line_of_business => "Centro de Acopio",
        :commune_id => 121, :address => "San fernando sin numero",:active =>true, :email => "company4@frutas.cl", :phone => "072-2345687",
         )
    c4.save(:validate => false)

    c5 = Company.new(:rut => "55555555-5", :name => "Frutas Flores", :line_of_business => "Centro de Acopio",
        :commune_id => 121, :address => "El boldo 331",:active =>true, :email => "company5@frutas.cl", :phone => "072-2335687",
         )
    c5.save(:validate => false)


    u1 = User.new(:email => "usuari1@acopio.com", :password => "qwertyui", :password_confirmation => "qwertyui", :super_admin => false, :company_id => c1.id, :active => true,
        :name => "Felipe", :lastname => "Navarro",  :gender => "Masculino" , :address => "Santa fe 331" , :commune_id => 122)
    u1.save(:validate => false)
    u1.roles << role

    u2 = User.new(:email => "usuari2@acopio.com", :password => "12345678", :password_confirmation => "12345678", :super_admin => false, :company_id => c1.id, :active => true,
        :name => "Felipe", :lastname => "Astroza",  :gender => "Masculino" , :address => "S/n" , :commune_id => 11)
    u2.save(:validate => false)
    u2.roles << role
    u3 = User.new(:email => "usuari3@acopio.com", :password => "12345678", :password_confirmation => "12345678", :super_admin => false, :company_id => c1.id, :active => true,
        :name => "Sergio", :lastname => "Silva",  :gender => "Masculino" , :address => "Aguas Negras #3312" , :commune_id => 111)
    u3.save(:validate => false)
    u3.roles << role
    u4 = User.new(:email => "usuari4@acopio.com", :password => "12345678", :password_confirmation => "12345678", :super_admin => false, :company_id => c2.id, :active => true,
        :name => "Daniel", :lastname => "Mella",  :gender => "Masculino" , :address => "Santa fe 331" , :commune_id => 125)
    u4.save(:validate => false)
    u4.roles << role
    u5 = User.new(:email => "usuari5@acopio.com", :password => "12345678", :password_confirmation => "12345678", :super_admin => false, :company_id => c2.id, :active => true,
        :name => "Francisco", :lastname => "Flores", :gender => "Masculino" , :address => "EL boldo" , :commune_id => 121)
    u5.save(:validate => false)
    u5.roles << role


r1 = Role.new(:name => "Administrar Usuarios", :description => "Usado para administras los usuarios de una compañia", :company_id => c1.id)
    r1.save
    a1=AccessRight.create(:model_name => "User", :action => "manage")
    r1.access_rights << a1
    a1=AccessRight.create(:model_name => "Company", :action => "manage")
    r1.access_rights << a1
        a1=AccessRight.create(:model_name => "AccessRight", :action => "manage")
        r1.access_rights << a1
        a1=AccessRight.create(:model_name => "Commune", :action => "manage")
        r1.access_rights << a1
        a1=AccessRight.create(:model_name => "Region", :action => "read")
        r1.access_rights << a1
        a1=AccessRight.create(:model_name => "User", :action => "manage")
        r1.access_rights << a1
        a1=AccessRight.create(:model_name => "Role", :action => "manage")
        r1.access_rights << a1


r2= Role.new(:name => "Administrar envases", :description => "Usado para realizar pruebas", :company_id => c1.id)
    r2.save
    a2=AccessRight.create(:model_name => "User", :action => "manage")
    r2.access_rights << a2
    a2=AccessRight.create(:model_name => "Company", :action => "manage")
    r2.access_rights << a2
        a2=AccessRight.create(:model_name => "AccessRight", :action => "manage")
        r2.access_rights << a2
        a2=AccessRight.create(:model_name => "Destination", :action => "manage")
        r2.access_rights << a2
        a2=AccessRight.create(:model_name => "Dispatch", :action => "manage")
        r2.access_rights << a2
        
        a2=AccessRight.create(:model_name => "Kind", :action => "manage")
        role.access_rights << a

        a2=AccessRight.create(:model_name => "PackGroupDispatch", :action => "manage")
        r2.access_rights << a2
        a2=AccessRight.create(:model_name => "PackGroupReceipt", :action => "manage")
        r2.access_rights << a2
        a2=AccessRight.create(:model_name => "PackType", :action => "manage")
        r2.access_rights << a2
        a2=AccessRight.create(:model_name => "Pallet", :action => "manage")
        r2.access_rights << a2
        a2=AccessRight.create(:model_name => "Producer", :action => "manage")
        r2.access_rights << a2
        a2=AccessRight.create(:model_name => "Quality", :action => "manage")
        r2.access_rights << a2
        a2=AccessRight.create(:model_name => "Receipt", :action => "manage")
        r2.access_rights << a2

r3 = Role.new(:name => "Administrar Inventario", :description => "Usado para administras el inventario de una compañia", :company_id => c1.id)
    r3.save
    a3=AccessRight.create(:model_name => "Supply", :action => "manage")
    r3.access_rights << a3
    a3=AccessRight.create(:model_name => "Provider", :action => "manage")
    r3.access_rights << a3
        a3=AccessRight.create(:model_name => "SuppliesProvidersLoan", :action => "manage")
        r3.access_rights << a3
        a3=AccessRight.create(:model_name => "SuppliesLoan", :action => "manage")
        r3.access_rights << a3
        a3=AccessRight.create(:model_name => "SuppliesReturn", :action => "manage")
        r3.access_rights << a3
  end

end
