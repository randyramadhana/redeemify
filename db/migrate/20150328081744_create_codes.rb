class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.string :name
      t.string :code
      t.string :release
      t.string :expiration

      t.timestamps
    end
  end
end
