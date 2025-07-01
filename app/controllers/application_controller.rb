class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  def require_login
    unless current_user
      redirect_to login_path, alert: "ログインが必要です"
    end
  end
end
