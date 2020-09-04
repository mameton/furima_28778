class TransactionsController < ApplicationController
  before_action :move_to_index
  require 'payjp'

  def index
    @item = Item.find(params[:item_id])
    # @transaction = Transaction.find(params[:item_id])
  end

  def new
    # @transaction = Transaction.new
    @transaction = Payment.new
  end

  def create
    # binding.pry
    @item = Item.find(params[:item_id])
    # @transaction = Transaction.new(transaction_params)
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
    Payjp.api_key = "sk_test_105f4f129491c3718b48ce7a"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: transaction_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
 
  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

 end


  # def create
  #   @transaction = Transaction.new(price: order_params[:price])
  #   if @transaction.valid?
  #     pay_item
  #     @transaction.save
  #     return redirect_to root_path
  #   else
  #     render 'index'
  #   end
  # end

  # # private

  # # def transaction_params
  # #   params.permit(:@item.price, :token)
  # # end

  # def pay_item
  #   Payjp.api_key = "sk_test_105f4f129491c3718b48ce7a"  # PAY.JPテスト秘密鍵
  #   Payjp::Charge.create(
  #     Payjp::Charge.create(
  #       amount: item_params[:price],  # 商品の値段
  #       card: item_params[:token],    # カードトークン
  #       currency:'jpy'                 # 通貨の種類(日本円)
  #     )
  #   end
 
  
  # end

  # def index
  # end
 
  