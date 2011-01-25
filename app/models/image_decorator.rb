Image.attachment_definitions[:attachment][:styles] = { :mini => '48x48>', :small => '150x120>', :product => '240x240>', :large => '600x600>' }
Image.attachment_definitions[:attachment][:storage] = :s3
Image.attachment_definitions[:attachment][:s3_credentials] = "#{Rails.root.to_s}/config/s3.yml"
Image.attachment_definitions[:attachment][:bucket] = "railsdog-radio"
Image.attachment_definitions[:attachment][:path] = ":attachment/:id/:style/:basename.:extension"
Image.attachment_definitions[:attachment][:s3_headers] = {'Cache-Control' => 'max-age=31557600'}
Image.attachment_definitions[:attachment][:default_url] = "/images/noimage/:style.png"
Image.attachment_definitions[:attachment].delete :url

#Taxon.attachment_definitions[:icon][:styles] = { :mini => '32x32>', :normal => '140x82>', :large => '661x-1' }
#Taxon.attachment_definitions[:icon][:storage] = :s3
#Taxon.attachment_definitions[:icon][:s3_credentials] = "#{RAILS_ROOT}/config/s3.yml"
#Taxon.attachment_definitions[:icon][:bucket] = "spree"
#Taxon.attachment_definitions[:icon][:path] = "taxons/:id/:style/:basename.:extension"
#Taxon.attachment_definitions[:icon][:s3_headers] = {'Cache-Control' => 'max-age=31557600'}
#Taxon.attachment_definitions[:icon].delete :url
