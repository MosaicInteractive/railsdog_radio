RailsdogRadio::Application.routes.draw do
  root :to => "homepage#show"

  # overriding default state for custom checkout steps
  match '/checkout' => 'checkout#edit', :state => 'address_and_payment', :as => :checkout
  match '/checkout/update/set_shipping' => 'checkout#set_shipping', :as => :set_shipping

end
