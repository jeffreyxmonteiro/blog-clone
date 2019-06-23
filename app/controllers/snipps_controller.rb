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

  def show
    @snipp = Snipp.find(params[:id])
  end

  def edit
    @snipp = Snipp.find(params[:id])
  end

  def update
    @snipp = Snipp.find(params[:id])
    @snipp.update(snipp_params)
    redirect_to snipp_path(@snipp), notice: 'Your snipp has been updated fam.'
  end

  private

  def snipp_params
    params.require(:snipp).permit(:medium, :quotation, :takeaway, :quoter, :source)
  end
end
