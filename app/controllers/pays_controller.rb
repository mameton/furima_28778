class PaysController < ApplicationController

  def index
  end

  def new
    @pay = UserItem.new
  end

  def create
    @pay = UserItem.new(pay_params)
    @pay.save
  end
  
  private

  def pay_params
    params.permit(:user_id,:item_id)
  end
end