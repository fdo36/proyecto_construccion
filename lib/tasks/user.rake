namespace :user do
  desc "Create an user"
  task :create, [:email, :password] => [:environment] do |t, args|
      puts User.create!(:email => args.email, :password => args.password, :password_confirmation => args.password)
  end

end
