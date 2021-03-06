class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      # t.string       :image                   ,null: false
      t.string       :name                    ,null: false
      t.text         :text                    ,null: false
      t.integer      :category_id             ,null: false
      t.integer      :price                   ,null: false
      t.integer      :condition_id            ,null: false
      t.integer      :postage_id              ,null: false
      t.integer      :exhibitor_prefecture_id  ,null: false
      t.integer      :days_id                 ,null: false
      t.references   :user                    ,foreign_key: true
      t.timestamps
    end
  end
end