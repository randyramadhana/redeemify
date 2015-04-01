class AddColumnsSetToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :codes, :thearray
  end
end
