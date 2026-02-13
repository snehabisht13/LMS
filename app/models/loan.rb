class Loan < ApplicationRecord
  belongs_to :bank
   has_many :loan_applications
  has_many :customers, through: :loan_applications
end
