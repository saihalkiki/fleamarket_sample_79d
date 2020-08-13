class ApplicationController < ActionController::Base
  # Basic認証
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_category

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

  def set_category
    @category_parent_array = Category.where(ancestry: nil)
  end

    # 記憶したURL（もしくはデフォルト値）にリダイレクト
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # アクセスしようとしたURLを覚えておく
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end

end
