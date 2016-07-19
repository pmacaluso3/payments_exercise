class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.decimal :paid_amount, precision: 8, scale: 2, null: false
      t.references :loan, null: false

      t.timestamps
    end
  end
end
