class AddColumnsEmailToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :email, :string
  end
end
