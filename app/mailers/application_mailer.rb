class ApplicationMailer < ActionMailer::Base
  helper :settings
  helper :application
  helper :mailer
  default from: proc { "#{Setting["mailer_from_name"]} <#{Setting["mailer_from_address"]}>" }
  layout "mailer"
  before_action :set_asset_host

  def set_asset_host
    self.asset_host ||= root_url.delete_suffix("/")
  end
end
