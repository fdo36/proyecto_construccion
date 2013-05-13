namespace :user do
  desc "Create an user"
  task :create, [:email, :password] => [:environment] do |t, args|
      user = User.new(:email => args.email, :password => args.password, :password_confirmation => args.password)
      user.roles=["superadmin"]
      if user.save(:validate => false)
         puts "OK"
      end
  end

end
