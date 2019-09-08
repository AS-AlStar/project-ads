class CreateAds < ActiveRecord::Migration[5.2]
  def change
    create_table :ads do |t|
      t.belongs_to :user
      t.string :title
      t.text :body
      t.string :image
      t.string :type

      t.timestamps
    end
  end
end
