FACEBOOK_SETTINGS = YAML.load_file(File.join(Rails.root,'config','facebook.yml'))[Rails.env].with_indifferent_access
CUSTOMERLOBBY_SETTINGS = YAML.load_file(File.join(Rails.root,'config','customerlobby.yml'))[Rails.env].with_indifferent_access

Cybersource = ActiveMerchant::Billing::CyberSourceGateway.new(
  :login => CUSTOMERLOBBY_SETTINGS[:cybersource_merchant_id],
  :password => CUSTOMERLOBBY_SETTINGS[:cybersource_transaction_key],
  :test => (Rails.env.development? || Rails.env.test? ) ? true : false
)

ActiveMerchant::Billing::CyberSourceGateway.logger = Rails.logger