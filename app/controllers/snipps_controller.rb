class SnippsController < ApplicationController
  before_action :only_see_own_snipp, only: [:show, :edit, :update, :destroy]
  before_action :only_create_own_snipp, only: [:new, :create]

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
      # render 'new' undefined method `snipps_path' for #<#<Class:0x00007f97b3b2a078>:0x00007f97b3b28408>
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
    if @snipp.update(snipp_params)
      redirect_to snipp_path(@snipp), notice: 'Your snipp has been updated fam.'
    else
      redirect_to edit_snipp_path(@snipp), notice: 'All fields must be fielded out.'
    end
  end

  private

  def snipp_params
    params.require(:snipp).permit(:medium, :quotation, :takeaway, :quoter, :source, :tag_list)
  end

   private

  def only_see_own_snipp
    @snipp = Snipp.find(params[:id])
    if current_user.id != @snipp.user.id
      redirect_to root_path, notice: "Sorry, but you are only allowed to view your own snipps."
    end
  end

  def only_create_own_snipp
    if current_user.id != params[:user_id].to_i
      redirect_to root_path, notice: "Sorry, but you are only allowed to create your own snipp."
    end
  end
end
