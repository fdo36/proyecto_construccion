require 'test_helper'

class PackingPalletTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

	test "PackingPallet verificacion de todos sus campos" do
  		packingPallet = PackingPallet.new
  		packingPallet.save
  		assert packingPallet.errors.size == 12
  	end
end
