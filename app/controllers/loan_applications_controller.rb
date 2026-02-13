class LoanApplicationsController < ApplicationController
  before_action :authenticate_customer!

  def new
  end

  def create
    loan = Loan.find(params[:loan_id])

    application = LoanApplication.new(
      loan: loan,
      customer: current_customer,
      status: "pending"
    )

    if application.save
      flash[:success] = "Loan applied"
      redirect_to all_banks_path
    else
      flash[:danger] = "Already applied for the loan"
      redirect_to all_banks_path
    end
  end
end
