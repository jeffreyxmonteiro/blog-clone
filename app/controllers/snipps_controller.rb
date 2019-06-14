class SnippsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @snipp = Snipp.new
  end

  def create
    @snipp = Snipp.new(snipp_params)
    @snipp.user = User.find(params[:user_id])
    @snipp.save
    redirect_to root_path
  end

  private

  def snipp_params
    params.require(:snipp).permit(:medium, :quotation, :takeaway, :quoter, :source)
  end
end
