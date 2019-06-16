class UsersController < ApplicationController
  before_action :only_see_own_page, only: [:show]

  def show
    @user = User.find(params[:id])
    @snipps = current_user.snipps.all
     @search = params["search"]
    if @search.present?
      @name = @search["name"]
      @snipps = Snipp.where(name: @name)
    end
  end

  def current_user_home
    redirect_to current_user
  end

 private

  def only_see_own_page
    if current_user.id != params[:id].to_i
      redirect_to root_path, notice: "Sorry, but you are only allowed to view your own profile page."
    end
  end
end
