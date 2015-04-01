class AddProviderToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :provider, :string
  end
end
