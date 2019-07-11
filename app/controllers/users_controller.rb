class UsersController < ApplicationController

  def show
    @user = current_user
    if params[:search].present?
      if Snipp.search_snipps(params[:search]).count > 0
        @snipps = current_user.snipps.search_snipps(params[:search])
      else
        @snipps = current_user.snipps.all
      end
    else
      @snipps = current_user.snipps.all
    end
  end

  def current_user_home
    redirect_to current_user
  end
end
