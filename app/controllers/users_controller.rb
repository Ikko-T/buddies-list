class UsersController < ApplicationController
  def show
    @buddies = current_user.buddies
  end
end
