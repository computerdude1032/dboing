#By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.name "Dan Bock"
  user.email  "danbock1@gmail.com"
  user.password "daniel"
  user.password_confirmation  "daniel"
end