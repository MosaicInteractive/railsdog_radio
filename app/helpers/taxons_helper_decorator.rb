TaxonsHelper.module_eval do
  def breadcrumbs(options={})
    return "" if current_page?("/")

    options.reverse_merge! :taxon => nil, :product => nil, :separator => "&nbsp;&raquo;&nbsp;"

    taxon         = options[:taxon]
    product       = options[:product]
    product_group = options[:product_group]
    separator     = raw(options[:separator])

    crumbs = [content_tag(:li, link_to(t(:home) , root_path) + separator)]

    if taxon
      crumbs << taxon.ancestors.collect { |ancestor| content_tag(:li, link_to(ancestor.name , seo_url(ancestor)) + separator) unless ancestor.root? }.compact unless taxon.ancestors.empty?
    end

    if product
      if taxon
        crumbs << content_tag(:li, link_to(taxon.name, seo_url(taxon)) + separator)
      elsif product_group
        crumbs << content_tag(:li, link_to(product_group.name, pg_search_path(:product_group_name => product_group.permalink)) + separator)
      else
        crumbs << content_tag(:li, link_to("Products", products_url) + separator)
      end
      crumbs << content_tag(:li, content_tag(:span, product.name))
    elsif taxon
      crumbs << content_tag(:li, content_tag(:span, taxon.name))
    elsif product_group
      crumbs << content_tag(:li, content_tag(:span, product_group.name))
    else
      crumbs << content_tag(:li, content_tag(:span, "Products"))
    end
    crumb_list = content_tag(:ul, raw(crumbs.flatten.map{|li| li.mb_chars}.join))
    content_tag(:div, crumb_list + tag(:br, {:class => 'clear'}, false, true), :class => 'breadcrumbs')
  end
end
