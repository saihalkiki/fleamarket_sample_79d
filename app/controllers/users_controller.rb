class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @item = current_user.items
  end
end
