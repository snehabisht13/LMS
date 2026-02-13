class CreateLoanApplications < ActiveRecord::Migration[8.0]
  def change
    create_table :loan_applications do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :loan, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
