require 'invoice'

class InvoicesController < ApplicationController

  # GET /invoices/company-name
  def show
    invoice = Invoice.new params[:company]
    render json: invoice.response
  end
end
