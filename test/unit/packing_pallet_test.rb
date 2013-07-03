require 'test_helper'

class PackingPalletTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

	test "" do
  		packingPallet = Packing_Pallet.new
  		packingPallet.save
  		assert packingPallet.errors.size == 5
  	end
end
