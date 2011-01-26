Taxon.attachment_definitions[:icon][:styles] = { :mini => '32x32>', :normal => '140x82>', :large => '661x-1' }
Taxon.attachment_definitions[:icon][:storage] = :s3
Taxon.attachment_definitions[:icon][:s3_credentials] = "#{RAILS_ROOT}/config/s3.yml"
Taxon.attachment_definitions[:icon][:bucket] = "spree"
Taxon.attachment_definitions[:icon][:path] = "taxons/:id/:style/:basename.:extension"
Taxon.attachment_definitions[:icon][:s3_headers] = {'Cache-Control' => 'max-age=31557600'}
Taxon.attachment_definitions[:icon].delete :url
