require './calculation'
class Shopping
  def initialize(file_name)
    @file = File.open(file_name)
    @file_lines = @file.readlines.map(&:chomp)
    @file.close
    @final_product_value = 0
    @final_taxes_value = 0
  end

  def call
    @file_lines.each do |line|
      splited_line = line.split
      format_input(splited_line)
    end
    calculate_total_shooping
  end

  def format_input(splited_line)
    product_quantity = splited_line.first
    product_value = splited_line.last
    quantity_index = splited_line.index(product_quantity) + 1
    value_index = splited_line.index(product_value) - 2
    product_name = splited_line[quantity_index..value_index].join(' ')
    calculate_taxes(product_quantity, product_name, product_value)
  end

  def calculate_total_shooping
    puts "Sales Taxes: #{@final_taxes_value}"
    puts "Total: #{@final_product_value}"
  end

  def calculate_taxes(quantity, product_name, value)
    calculation = Calculation.new(product_name, value, quantity)
    @final_product_value += calculation.final_product_value
    @final_taxes_value += calculation.taxes_value
    puts "#{quantity.to_i} #{product_name}: #{calculation.final_product_value}"
  end
end

Shopping.new('input_file.txt').call
