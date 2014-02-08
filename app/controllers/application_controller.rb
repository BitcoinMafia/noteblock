class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  after_filter :set_csrf_cookie_for_ng

  # Entry point for AngularJS app
  # /# Namespaced is all handled by AngularJs
  def index
    render layout: false
  end

  def unfound_assets
    puts "Caught unfound assets"
    render nothing: true, status: 404
  end

  protected

  def set_csrf_cookie_for_ng
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  def verified_request?
    super || form_authenticity_token == request.headers['X-XSRF-TOKEN']
  end
end
