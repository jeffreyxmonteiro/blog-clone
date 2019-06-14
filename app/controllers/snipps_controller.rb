class SnippsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @snipp = Snipp.new
  end

  def create
    @snipp = Snipp.new(snipp_params)
    @snipp.user = User.find(params[:user_id])
    if @snipp.save
      redirect_to root_path, notice: 'Your snipp has been created fam.'
    else
      redirect_to new_user_snipp_path, notice: 'Please fill out all the fields.'
    end
  end

  def destroy
    @snipp = Snipp.find(params[:id])
    @snipp.destroy
    redirect_to root_path
  end

  private

  def snipp_params
    params.require(:snipp).permit(:medium, :quotation, :takeaway, :quoter, :source)
  end
end
