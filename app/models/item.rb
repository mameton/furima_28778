class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :condition, :postage, :exhibitor_prefecture, :days

  validates :image, :name, :text, :category, :price, :condition, :postage, :exhibitor_prefecture, :days, presence: true

  validates :cotegory_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 } 
  validates :days_id, numericality: { other_than: 1 } 
  validates :exhibitor_prefecture_id, numericality: { other_than: 1 } 
  validates :postage_id, numericality: { other_than: 1 } 

end