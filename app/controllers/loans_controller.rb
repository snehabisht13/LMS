class LoansController < ApplicationController
  before_action :authenticate_bank!

  def index
    @loans = current_bank.loans.order(created_at: :desc)
  end

  def new
    @loan = Loan.new
  end

  def create
    @loan = current_bank.loans.build(loan_params)
    if @loan.save
      flash[:notice] = "Loan added successfully"
      redirect_to loans_path
    else
      render :new
    end
  end

  def destroy
    @loan = current_bank.loans.find(params[:id])
    @loan.destroy
    flash[:notice] = "Loan deleted"
    redirect_to loans_path
  end
  
  def applications
  @applications = LoanApplication
                    .joins(:loan)
                    .where(loans: { bank_id: current_bank.id })
  end

   def approve
    @application = LoanApplication.find(params[:id])
    if @application.update(status: "Approved")
      redirect_to root_path, notice: "Application approved successfully."
    else
      redirect_to root_path, alert: "Failed to approve application."
    end
  end


  private

  def loan_params
    params.require(:loan).permit(
      :title, :description, :interest_rate,
      :max_amount, :tenure_months
    )
  end
end
