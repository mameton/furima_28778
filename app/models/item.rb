class Item < ApplicationRecord
  has_one :pay , dependent: :destroy
  belongs_to :user
  has_one_attached :image
  attr_accessor :token

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :exhibitor_prefecture
  belongs_to_active_hash :days

  validates :image, :name, :text, :category, :price, :condition, :postage, :exhibitor_prefecture, :days, presence: true
    validates :category_id, numericality: { other_than: 1 }
    validates :condition_id, numericality: { other_than: 1 }
    validates :days_id, numericality: { other_than: 1 }
    validates :exhibitor_prefecture_id, numericality: { other_than: 1 }
    validates :postage_id, numericality: { other_than: 1 }
  
    validates :price, numericality: { less_than: 9_999_999 }
    validates :price, numericality: { greater_than_or_equal_to: 300 }
end
