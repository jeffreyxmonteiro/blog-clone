class UsersController < ApplicationController
  before_action :only_see_own_page, only: [:show]

  def show
    @user = User.find(params[:id])
    if params[:search].present?
      if Snipp.search_snipps(params[:search]).count > 0
        @snipps = current_user.snipps.search_snipps(params[:search])
      else
        @snipps = current_user.snipps.all
      end
    elsif params[:tag].present?
      @snipps = current_user.snipps.tagged_with(params[:tag])
    else
      @snipps = current_user.snipps.all
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
