ProductsController.class_eval do
  PG_REFERER_REGEXP = /^https?:\/\/[^\/]+\/pg\/([a-z0-9\-]+)$/

  before_filter :load_pg, :only => [:show, :index]

  private
    def load_pg
      if params.key? :product_group_name
        @product_group = ProductGroup.find_by_permalink(params[:product_group_name])
      else
        referer = request.env['HTTP_REFERER']

        if referer  && referer.match(PG_REFERER_REGEXP)
          @product_group = ProductGroup.find_by_permalink($1)
        end

      end
    end
end
