require 'spec_helper'
require_relative '../calculation'

describe Calculation do
  describe '#final_product_value' do
    it 'returns the final product value' do
      class_instance = described_class.new('imported bottle of perfume', 27.99, 1)

      expect(class_instance.final_product_value).to eq(32.19)
    end
  end

  describe '#import_taxes_calculation' do
    it 'returns the taxes for imported products' do
      class_instance = described_class.new('imported bottle of perfume', 27.99, 1)

      expect(class_instance.import_taxes_calculation).to eq(1.4)
    end
  end

  describe '#default_taxes_calculation' do
    it 'returns the taxes for product not exempt' do
      class_instance = described_class.new('imported bottle of perfume', 27.99, 1)

      expect(class_instance.default_taxes_calculation).to eq(2.8)
    end
  end

  describe '#taxes_value' do
    it 'returns the sum of taxes for the product' do
      class_instance = described_class.new('imported bottle of perfume', 27.99, 1)

      expect(class_instance.taxes_value).to eq(4.2)
    end
  end

  describe '#verify_exempt' do
    it 'returns if a product is exempt' do
      class_instance = described_class.new('imported bottle of perfume', 27.99, 1)

      expect(class_instance.verify_exempt).to eq(false)
    end
  end

  describe '#verify_imported' do
    it 'returns if a product is imported' do
      class_instance = described_class.new('imported bottle of perfume', 27.99, 1)

      expect(class_instance.verify_imported).to eq(true)
    end
  end

  describe '#round_value' do
    it 'returns the rounded value' do
      class_instance = described_class.new('imported bottle of perfume', 27.99, 1)

      expect(class_instance.round_value(2.44)).to eq(2.45)
    end
  end
end
