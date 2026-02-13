module Customers
  class ProfilesController < ApplicationController
    def index
      @banks = Bank.all
    end

    def show
      @customer = current_customer
    end

    def application
      @applications = current_customer.loan_applications.includes(:loan)
    end


  end
end



