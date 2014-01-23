class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.boolean :paid, default: false
      t.decimal :amount, precision: 15, scale: 2
      t.string :currency
      t.boolean :refunded, default: false
      t.integer :customer_id
      t.timestamps
    end

    add_index :charges, :customer_id
  end
end
