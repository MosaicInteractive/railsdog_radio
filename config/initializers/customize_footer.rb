class CustomizeFooterHook < Spree::ThemeSupport::HookListener
  replace :footer_left do
    %Q{ <p><%= t("powered_by") %> <a href="http://spreecommerce.com/">Spree</a> v<%=Spree.version%> </p> }
  end
end

