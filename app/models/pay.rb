class Pay < ApplicationRecord
  attr_accessor :token

  has_one :trade, class_name:"Transaction"
  belongs_to :user
  belongs_to :item ,dependent: :destroy
end
