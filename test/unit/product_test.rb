require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "product attributes must not be empty"
	product = Product.new
	assert product.invalid?
  end
end
