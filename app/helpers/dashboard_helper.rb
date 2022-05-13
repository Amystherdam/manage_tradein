module DashboardHelper
  def month_name(number_month)
    Date::MONTHNAMES[number_month]
  end

  def extract_attrs_sale_data(regex, sale_product_data)
    data_match = regex.match(sale_product_data)
    target_att_value = /\d{1,}/.match(data_match[0])
    target_att_value[0].to_i
  end

  def total_sales_amount(sales_by_month)
    product_ids = []
    product_quantities = []
    total_sale = 0.0

    sales_product_data = sales_by_month.reject {|object| object.class.to_s != "Array"}.flatten.map(&:product).flatten

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
end
