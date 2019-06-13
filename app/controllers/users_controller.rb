class UsersController < ApplicationController
  before_action :authenticate_user!
  # before_action :only_see_own_page, only: [:show]

  def show
    @user = User.find(params[:id])
  end

  def current_user_home
    redirect_to current_user
  end

 private

  # def only_see_own_page
  #   if current_user.id != params[:id]
  #     redirect_to root_path, notice: "Sorry, but you are only allowed to view your own profile page."
  #   end
  # end
end
