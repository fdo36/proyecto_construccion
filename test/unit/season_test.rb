require 'test_helper'

class SeasonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  #test abrir una temporada para la especie 4
  test "Season done 1" do
  	season = Season.new
  	season.init_date = "2013-07-01"
  	season.kind_id = 4
  	assert season.save
  end
  #test abrir una temporada para la especie 5
  test "Season done 2" do
  	season = Season.new
  	season.init_date = "2013-07-02"
  	season.kind_id = 5
  	assert season.save
  end  

end
