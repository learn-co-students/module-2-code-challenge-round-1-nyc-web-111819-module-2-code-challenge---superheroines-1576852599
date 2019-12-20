class AddColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :power_id :string
  end
end
