class EditCustomers < ActiveRecord::Migration[5.2]
  def change
  	remove_column :customers, :admin, :boolean
  	remove_column :customers, :is_deleted, :boolean
  end
end
