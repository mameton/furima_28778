class TransactionsController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  
#   def create
#     @transaction = Transaction.new(transaction_params)
#     if @transaction.valid?
#       pay_item
#       @transaction.save
#       return redirect_to root_path
#     else
#       render 'index'
#     end
 
#   end

#   private

#   def transaction_params
#     params.require(:transaction).permit(:post_number, :buyer_prefecture_id, :city, :adress, :phone_number, :builiding_name, :token).merge(user_id: current_user.id)
#   end

#   def pay_item
#     Payjp.api_key = "sk_test_105f4f129491c3718b48ce7a"  # PAY.JPテスト秘密鍵
#     Payjp::Charge.create(
#       amount: @item.price,  # 商品の値段
#       card: transaction_params[:token],    # カードトークン
#       currency:'jpy'                 # 通貨の種類(日本円)
#     )
#   end
 
  def item_params
    params.require(:item).permit(:text, :category_id, :price, :condition_id, :postage_id, :exhibitor_prefecture_id, :days_id).merge(user_id: current_user.id)
  end
end
