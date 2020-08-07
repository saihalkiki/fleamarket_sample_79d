# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    authorization
  end

  def google_oauth2
    authorization
  end

  def failure
    redirect_to root_path
  end

  private

  def authorization
    #env["omniauth.auth"]からユーザーの情報を取得します。

    sns_info = User.from_omniauth(request.env["omniauth.auth"])
    @user = sns_info[:user]

  #ユーザー情報が登録済みの場合、ログイン処理を行う
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
    else
  #ユーザー情報が未登録の場合、deviseの新規登録に移動する。
      @sns_id = sns_info[:sns].id
      render template: 'devise/registrations/new'
    end
  end
end
