class LogoutController < ApplicationController
  def destroy
    session.clear

    redirect_to root_path
  end
end
