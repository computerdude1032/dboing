#require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    require 'faker'
    Rake::Task['db:reset'].invoke
    admin= User.create!(:name => "Dan", :lname =>"Bock", :username => "computerdude1032", :email=>"computerdude1032@gmail.com", :password =>"daniel", :password_confirmation=> "daniel")
    admin.toggle!(:admin)
    99.times do |n|
      name = Faker::Name.name
      email="example-#{n+1}@railstutorial.org"
      username="test-#{n+1}"
      password="password"
      User.create!(:name =>name, :lname =>"er", :username =>username, :email=>email,:password=>password,:password_confirmation=>password)
    end
    User.all.each do |user|
      50.times do
        user.microposts.create!(:content =>Faker::Lorem.sentence(5))
      end
    end
  end
end