class Payment

  include ActiveModel::Model
  attr_accessor :post_number, :buyer_prefecture_id, :city, :address, :building_name, :phone_number, :item_id, :user_id, :token, :authenticity_token

    validates :post_number, :buyer_prefecture_id, :city, :address, :phone_number, presence: true

    validates :buyer_prefecture_id, numericality: { other_than: 1 }

    POST_NUMBER_REGEX = /\A\d{3}[-]\d{4}\z/.freeze
    validates_format_of :post_number, with: POST_NUMBER_REGEX

    PHONE＿NUMBER＿REGEX = /\A\d{11}\z/.freeze
    validates_format_of :phone_number, with: PHONE＿NUMBER＿REGEX

  def save
    pay = Pay.create(user_id: user_id, item_id: item_id)
    Transaction.create(post_number: post_number, buyer_prefecture_id: buyer_prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number ,pay_id: pay.id)
  end
end