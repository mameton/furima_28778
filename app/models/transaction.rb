class Transaction < ApplicationRecord
  belongs_to :pay
  belongs_to :user
  belongs_to :item
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :buyer_prefecture

  validates :post_number, :buyer_prefecture, :city, :adress, :phone_number, presence: true

  validates :buyer_prefecture_id, numericality: { other_than: 1 }

  POST_NUMBER_REGEX = /\A\d{3}[-]\d{4}\z/.freeze
  validates_format_of :post_number, with: POST_NUMBER_REGEX

  PHONE＿NUMBER＿REGEX = /\A\d{11}\z/.freeze
  validates_format_of :phone_number, with: PHONE＿NUMBER＿REGEX
end
