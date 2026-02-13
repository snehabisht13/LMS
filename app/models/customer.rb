class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :loan_applications
  has_many :loans, through: :loan_applications

   def applied_for?(loan)
    loan_applications.exists?(loan_id: loan.id)
  end
         
end
