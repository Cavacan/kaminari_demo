# Controller for handling user sessions (login and logout).
class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to root_path
    else
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
