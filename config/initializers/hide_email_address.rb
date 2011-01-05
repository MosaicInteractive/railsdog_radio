class SpreeStaticContentHooks < Spree::ThemeSupport::HookListener

  replace :admin_users_index_rows do
    %Q{ <td width="350px"><%=link_to user.email.gsub(/./,'*'), object_url(user) %></td> }
  end

end
