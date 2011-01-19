Factory.define(:user) do |f|
  f.email { Faker::Internet.email }
  f.password "spree123"
  f.password_confirmation "spree123"
end

Factory.define(:admin_user, :parent => :user) do |u|
  u.roles { [Role.find_by_name("admin") || Factory(:role, :name => "admin")]}
end

Factory.define(:read_only_user, :parent => :user) do |u|
  u.roles { [Role.find_by_name("read_only") || Factory(:role, :name => "read_only")]}
end


