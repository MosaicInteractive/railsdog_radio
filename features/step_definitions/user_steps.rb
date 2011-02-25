Given /^I have a read only account of "(.+)\/(.+)"$/ do |email, password|
  Factory(:read_only_user,  :email => email, :password => password, :password_confirmation => password)
end

When /^I sign in as "(.*)\/(.*)"$/ do |email, password|
  When %{I go to the sign in page"}
  And %{I fill in "Email" with "#{email}"}
  And %{I fill in "Password" with "#{password}"}
  And %{I press "Log In"}
end
