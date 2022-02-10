class BuddiesController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_buddy, only: %i[ show edit update destroy ]

  def index
    @buddies = Buddy.all.order(created_at: :DESC)
  end

  def new
    @buddy = Buddy.new
  end

  def create
    @buddy = current_user.buddies.create!(buddy_params)
    flash[:notice] = "Buddy was successfully created"
    render :show
  end

  def show
  end

  def edit
  end

  def update
    @buddy.update!(buddy_params)
    flash[:notice] = "Buddy was successfully updated"
    render :show
  end

  def destroy
    @buddy.destroy!
    flash[:alert] = "Buddy was successfully deleted"
    redirect_to users_path
  end

  private

  def set_buddy
    @buddy = Buddy.find(params[:id])
  end

  def buddy_params
    params.require(:buddy).permit(:first_name, :last_name, :email, :phone, :age)
  end
end
