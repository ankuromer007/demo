class UsersController < ApplicationController

	before_filter :authenticate_user!

  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
  end

  def avatars
  	user = User.find(params[:id])
  	style = params[:style] ? params[:style] : 'original'
  	send_data user.avatar.file_contents(style), :type => user.avatar_content_type
  end
end
