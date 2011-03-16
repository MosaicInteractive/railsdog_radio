RailsdogRadio::Application.routes.draw do
  # redirect railsdogradio.com to the demo subdomain
  constraints(:host => /railsdogradio.com/) do
    root :to => redirect("http://demo.spreecommerce.com")
    match '/*path', :to => redirect {|params| "http://demo.spreecommerce.com/#{params[:path]}"}
  end

  root :to => "homepage#show"

  # overriding default state for custom checkout steps
  match '/checkout' => 'checkout#edit', :state => 'payment', :as => :checkout
  match '/checkout/update/set_shipping' => 'checkout#set_shipping', :as => :set_shipping

end
