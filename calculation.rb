# frozen_string_literal: true

class Calculation
  IMPORTED_TAX = 0.05
  DEFAULT_TAX = 0.10
  TAX_EXEMPT = %w[book chocolates pills chocolate].freeze

  def initialize(product_name, value, quantity)
    @product_name = product_name
    @value = value.to_f
    @quantity = quantity.to_i
  end

  def final_product_value
    ((@quantity * @value) + import_taxes_calculation + default_taxes_calculation).round(2)
  end

  def import_taxes_calculation
    verify_imported ? round_value(@quantity * (@value * IMPORTED_TAX)) : 0
  end

  def default_taxes_calculation
    verify_exempt ? 0 : round_value(@quantity * (@value * DEFAULT_TAX))
  end

  def taxes_value
    (import_taxes_calculation + default_taxes_calculation).round(2)
  end

  def verify_exempt
    TAX_EXEMPT.any? { |substring| @product_name.include? substring }
  end

  def verify_imported
    @product_name.include? 'imported'
  end

  def round_value(value)
    (value * 20).round / 20.0
  end
end
