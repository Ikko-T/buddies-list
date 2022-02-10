class UsersController < ApplicationController
  def show
    @buddies = current_user.buddies.order(created_at: :DESC)
  end
end
