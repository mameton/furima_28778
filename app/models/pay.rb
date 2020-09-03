class Pay < ApplicationRecord
  # has_one :transaction
  belongs_to :user
  belongs_to :item
end
