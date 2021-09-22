class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[ show edit update destroy ]

  def index
    @users = User.all
  end

  def show # show user by id // i don't know if it's gonna work tho
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new user_params

    if @user.save
      redirect_to @user, notice: "Novo usuário registrado."
    else
      flash.now[:alert] = @user.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    if @user.update user_params
      redirect_to @user, notice: "Usuário atualizado."
    else
      flash.now[:alert] = @user.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: "Usuário removido com sucesso."
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end
end
