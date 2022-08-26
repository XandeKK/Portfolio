class ApplicationController < ActionController::Base
  include Clearance::Controller

  def url_after_denied_access_when_signed_out
    root_path
  end
end
