require 'test_helper'

class FinalPackingPalletTest < ActiveSupport::TestCase

	#refute = false
	#assert = true

  	test "Final Packing Pallet sin atributos" do
		final_packing_pallet = FinalPackingPallet.new
		refute final_packing_pallet.save
	end

	test "Final Packing Pallet con solo una especie" do
		final_packing_pallet = FinalPackingPallet.new
		final_packing_pallet.kind_id = 1
		final_packing_pallet.save
		assert final_packing_pallet.errors.size == 8
	end

	test "Final Packing Pallet con todos los atributos" do
		final_packing_pallet = FinalPackingPallet.new
		final_packing_pallet.kind_id = 1
		final_packing_pallet.variety_id = 1
		final_packing_pallet.quality_id = 1
		final_packing_pallet.pack_packing_id = 1
		final_packing_pallet.format_id = 1
		final_packing_pallet.quantity = 40
		final_packing_pallet.net_weight = 500
		assert final_packing_pallet.save
	end
end
