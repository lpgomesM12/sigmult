class Api::V1::ApplicationController < ActionController::Base
  before_filter :set_default_format

  protected
  def set_default_format
    request.format = "json"
  end
end
