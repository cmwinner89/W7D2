class AddForeignKeytoBandsTable < ActiveRecord::Migration[5.2]
  def change
    add_column :bands, :member_id, :integer, null: false

    add_index :bands, :member_id
  end
end
