require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @product = Product.create(title: "a title", description:"A valid description", price:55.56, stock:5)
  end
  
  
  test "product must be valid" do
    assert @product.valid?
  end
  
  
  test "title must be present" do
    @product.title = ""
    assert_not @product.valid?
  end
  
  test "title must not be too short" do
    @product.title = "a"
    assert_not @product.valid?
  end
  
  test "title must not be too long" do
    @product.title = "a"*51
    assert_not @product.valid?
  end
  
  test "description must be present" do
    @product.description = ""
    assert_not @product.valid?
  end
  
  test "description must not be too short" do
    @product.description = "a"*9
    assert_not @product.valid?
  end
  
  test "description must not be too long" do
    @product.description = "a"*1025
    assert_not @product.valid?
  end
  
  test "price must be positive" do
    @product.price = -1
    assert_not @product.valid?
  end
  
  test "stock must be psotive" do
    @product.stock = -1
    assert_not @product.valid?
  end


end
