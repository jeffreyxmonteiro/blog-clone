class TagsController < ApplicationController
  def show
    @user = current_user
    if params[:tag]
      @snipps = current_user.snipps.tagged_with(params[:tag])
    else
      @snipps = current_user.snipps.all
    end
  end
end
