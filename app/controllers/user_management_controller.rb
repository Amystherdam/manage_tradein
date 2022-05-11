class UserManagementController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  authorize_resource :class => :user_management

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end
  
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_management_path(@user), notice: "User succesfully created!" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation) 
    end

    if @user.update_attributes(user_params)
      redirect_to user_management_path(@user), notice: "User succesfully updated."
    else
      render :edit
    end
  end

  def destroy
    if current_user.id != params[:id].to_i
      if @user.destroy
        redirect_to user_management_index_path, notice: "User has been destroyed"
      else
        render :index, notice: "Failed to delete user"
      end
    else
      redirect_to user_management_index_path, notice: "Failed to delete user"
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(
        :email, :password, :password_confirmation, user_profile_attributes: [:id, :name, :phone, :gender, :picture]
      )
    end
end
