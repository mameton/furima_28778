class TransactionsController < ApplicationController
  before_action :move_to_index
  before_action :seller
  before_action :sold
  require 'payjp'

  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @transaction = Payment.new
  end

  def create
    @item = Item.find(params[:item_id])
    @transaction = Payment.new(transaction_params)
    if @transaction.valid?
       pay_item
      @transaction.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  def show
    @item = Item.find(params[:item_id])
  end
 
  private
 
  def transaction_params
    params.permit(:post_number, :buyer_prefecture_id, :city, :address, :building_name, :phone_number, :token, :authenticity_token, :item_id, :pay_id).merge(user_id: current_user.id)
  end
 
  def pay_item
    Payjp.api_key = "sk_test_105f4f129491c3718b48ce7a"
    Payjp::Charge.create(
      amount: @item.price,
      card: transaction_params[:token],
      currency:'jpy'
    )
  end
 
  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def seller
    @item = Item.find(params[:item_id])
    if current_user.id == @item.id
      redirect_to root_path
    end
  end

  def sold
    @item = Item.find(params[:item_id])
     if @item.pay != nil
      redirect_to root_path
    end
  end

end