class PagesController < ApplicationController
  def about
  end

  def contact
  end

  def myprofile
    @user = current_user
  end

  def update_my_profile
    @user = current_user
    @user.update(user_params)
    redirect_to myprofile_path, notice: 'user updated!'
  end

  private

  def user_params
    params.require(:user).permit(:photo)
  end
end
