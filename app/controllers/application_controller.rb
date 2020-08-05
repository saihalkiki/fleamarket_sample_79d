class ApplicationController < ActionController::Base
  # Basic認証
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end
  end

  def production?
    Rails.env.production?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :first_name,
                                      :last_name_read, :first_name_read, :gender, :birthday])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :last_name, :first_name,
                                      :last_name_read, :first_name_read, :gender, :birthday])
  end

  def set_search
    # 検索オブジェクト
    @search = Item.ransack(params[:q])
    # 検索結果
    @items = @search.result
  end

end
