class Pay

  include include ActiveModel::Model
  attr_accessor :name, :email, :first_name, :last_name, :first_name_phonetic, :last_name_phonetic, :birthday, :image, :name, :text, :category, :price, :condition, :postage, :exhibitor_prefecture, :days, :post_number, :buyer_prefecture_id, :city, :building_name, :phone_number

    #usermodel
    validates :name, presence: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :first_name_phonetic, presence: true
    validates :last_name_phonetic, presence: true
    validates :birthday, presence: true

    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX

    NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
    validates_format_of :first_name, with: NAME_REGEX
    validates_format_of :last_name, with: NAME_REGEX

    NAME_PHOTNETIC_REGEX = /\A[ァ-ヶー－]+\z/.freeze
    validates_format_of :first_name_phonetic, with: NAME_PHOTNETIC_REGEX
    validates_format_of :last_name_phonetic, with: NAME_PHOTNETIC_REGEX
 
    validates :image, :name, :text, :category, :price, :condition, :postage, :exhibitor_prefecture, :days, presence: true
    validates :token, presence: true
    validates :category_id, numericality: { other_than: 1 }
    validates :condition_id, numericality: { other_than: 1 }
    validates :days_id, numericality: { other_than: 1 }
    validates :exhibitor_prefecture_id, numericality: { other_than: 1 }
    validates :postage_id, numericality: { other_than: 1 }
  
    validates :price, numericality: { less_than: 9_999_999 }
    validates :price, numericality: { greater_than_or_equal_to: 300 }

    validates :post_number, :buyer_prefecture, :city, :address, :phone_number, presence: true

    validates :buyer_prefecture_id, numericality: { other_than: 1 }

    POST_NUMBER_REGEX = /\A\d{3}[-]\d{4}\z/.freeze
    validates_format_of :post_number, with: POST_NUMBER_REGEX

    PHONE＿NUMBER＿REGEX = /\A\d{11}\z/.freeze
    validates_format_of :phone_number, with: PHONE＿NUMBER＿REGEX

  def save
    user = User.create(name: name, first_name: first_name, last_name: last_name, first_name_phonetic: first_name_phonetic, last_name_phonetic: last_name_phonetic, birthday: birthday)
    item = Item.create(name: name, text: text, category_id, price: price, condition_id: condition_id, postage_id: postage_id, exhibitor_prefecture_id: exhibitor_prefecture_id,days_id: days_id, user_id: user.id)
    Transaction.create(post_number: post_number, buyer_prefecture_id: buyer_prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, item_id: item.id)
    Pay.create(user_id: user.id, item_id: item.id)
  end
end