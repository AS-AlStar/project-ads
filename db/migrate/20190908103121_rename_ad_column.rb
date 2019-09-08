class RenameAdColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :ads, :type, :state
  end
end
