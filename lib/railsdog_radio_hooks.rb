class RailsdogRadioHooks < Spree::ThemeSupport::HookListener

  insert_before :sidebar do
    "<%= render 'shared/recently_viewed_products' %>"
  end

end