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
    @buddy = current_user.buddies.build(buddy_params)

    if @buddy.save
      redirect_to @buddy, notice: "Buddy was successfully created"
    else
      flash.now[:alert] = "Buddy was NOT created!"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @buddy.update(buddy_params)
      redirect_to @buddy, notice: "Buddy was successfully updated"
    else
      flash.now[:alert] = "Buddy was NOT updated"
      render :edit
    end
  end

  def destroy
    @buddy.destroy
    redirect_to users_path, alert: "Buddy was successfully deleted"
  end

  private

  def set_buddy
    @buddy = Buddy.find(params[:id])
  end

  def buddy_params
    params.require(:buddy).permit(:first_name, :last_name, :email, :phone, :age)
  end
end
