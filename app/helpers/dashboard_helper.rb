module DashboardHelper
  def month_name(number_month)
    Date::MONTHNAMES[number_month]
  end

  def extract_attrs_sale_data(regex, sale_product_data)
    data_match = regex.match(sale_product_data)
    target_att_value = /\d{1,}/.match(data_match[0])
    target_att_value[0].to_i
  end

  def total_sales_amount(sales_by_month, sales_product_data = nil)
    product_ids = []
    product_quantities = []
    total_sale = 0.0

    if sales_product_data
      sales_product_data = sales_product_data.flatten
    else
      sales_product_data = sales_by_month.reject {|object| object.class.to_s != "Array"}.flatten.map(&:product).flatten
    end

    sales_product_data.each do |sale_product_data|
      product_ids.push extract_attrs_sale_data(/id=>\d{1,}/, sale_product_data)
      product_quantities.push extract_attrs_sale_data(/quantiti=>\d{1,}/, sale_product_data)
    end

    product_ids.each_with_index do |product_id, i|
      product = Product.find(product_id) if product == nil || product.id != product_id
      total_sale += product.price * product_quantities[i]
    end

    total_sale
  end

  def top_customers(sales_by_months)
    total_per_customers = []
    rank_month_customers = []
    month = 1

    sales_by_months.each do |sales_by_month|
      sales_by_month.reject {|object| object.class.to_s != "Array"}.flatten.group_by {|sale| sale.customer }.each do |customer, sales|
        sales_product_data = sales.map(&:product)
        total_per_customers.push [customer.name, total_sales_amount(sales, sales_product_data)]
      end

      total_per_customers.sort_by {|customer, total| total }.reverse.take(3).each do |total_per_customer| 
        rank_month_customers.push [month, "#{total_per_customer[0]}", total_per_customer[1]]
      end

      total_per_customers = []
      month += 1
    end

    rank_month_customers
  end
end
