class Users::RegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  def create
    if params[:sns_auth] == 'true'
      pass = Devise.friendly_token
      params[:user][:password] = pass
      params[:user][:password_confirmation] = pass
    end
    @user = User.new(sign_up_params)
    unless @user.valid?
      render :new and return
    end
    # @userのデータをsessionにハッシュの形で情報を保持させている @userの属性を全て整形している
    session["devise.regist_data"] = { user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    @address = @user.build_address
    render :new_address
  end

  def create_address
    @user = User.new(session["devise.regist_data"]["user"])
    @address = Address.new(address_params)
    unless @address.valid?
      render :new_address and return
    end
    @user.build_address(@address.attributes)
    @user.save
    session["devise.regist_data"]["user"].clear
    sign_in(:user, @user)
    redirect_to root_path
  end
  protected

  def address_params
    params.require(:address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :last_name, :first_name, :last_name_read, :first_name_read)
  end
end
