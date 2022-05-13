class DashboardController < ApplicationController
  def index
    @sales_by_months = Sale.all.group_by {|sale| sale.date_sale.month }.sort_by { |month, sales| month }
  end
end
