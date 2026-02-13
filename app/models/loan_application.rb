class LoanApplication < ApplicationRecord
  belongs_to :customer
  belongs_to :loan
  validates :status, presence: true
  validates :loan_id, uniqueness: { scope: :customer_id }
end
