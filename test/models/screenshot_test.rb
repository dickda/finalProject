require 'test_helper'

class ScreenshotTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @screenshot = Screenshot.create(product_id: 5)
  end
    
  test "screenshot must be valid" do
    assert @screenshot.valid?
  end
  
  test "image can be empty" do
    @screenshot.image = nil
    assert @screenshot.valid?
  end

end