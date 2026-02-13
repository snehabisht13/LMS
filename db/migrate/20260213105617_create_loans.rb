class CreateLoans < ActiveRecord::Migration[8.0]
  def change
    create_table :loans do |t|
      t.string :title
      t.text :description
      t.decimal :interest_rate
      t.integer :max_amount
      t.integer :tenure_months
      t.references :bank, null: false, foreign_key: true

      t.timestamps
    end
  end
end
