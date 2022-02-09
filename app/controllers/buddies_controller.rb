class BuddiesController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @buddies = Buddy.all.order(id: "DESC")
  end

  def new
    @buddy = Buddy.new
  end

  def create
    current_user.buddies.create!(buddy_params)
    redirect_back(fallback_location: root_path)
  end

  def show
  end

  def update
  end

  def destroy

  end

  private

  def buddy_params
    params.require(:buddy).permit(:first_name, :last_name, :email, :phone, :age)
  end
end
