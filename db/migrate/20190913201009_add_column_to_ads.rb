# frozen_string_literal: true

class AddColumnToAds < ActiveRecord::Migration[5.2]
  def change
    add_column :ads, :category_id, :bigint
    add_index :ads, :category_id
  end
end
