namespace :reports_data do
  desc "TODO"
  task :load => :environment do
  	
  	#Borramos todo
    for p in Producer.all
      p.kinds.delete_all
      p.pack_types.delete_all
    end
    Pallet.delete_all
  	PackGroupReceipt.delete_all
  	Receipt.delete_all
  	PackGroupDispatch.delete_all
  	Dispatch.delete_all
  	PackType.delete_all
  	Variety.delete_all
    
  	Kind.delete_all
  	Quality.delete_all
  	Producer.destroy_all
  	Destination.delete_all
    Locality.delete_all

    #Agregar Localidades
    l1 = Locality.new(:commune_id => 117, :name => "Curico")
    l1.save(:validate => false)

    l2 = Locality.new(:commune_id => 117, :name => "Romeral")
    l2.save(:validate => false)

    l3 = Locality.new(:commune_id => 117, :name => "Rauco")
    l3.save(:validate => false)

    l4 = Locality.new(:commune_id => 117, :name => "La Huerta")
    l4.save(:validate => false)

    l5 = Locality.new(:commune_id => 117, :name => "Hualane")
    l5.save(:validate => false)

    l6 = Locality.new(:commune_id => 117, :name => "Licanten")
    l6.save(:validate => false)

  	#Agregar Productores
  	p1 = Producer.new(:rut => "12110828-3", :name => "AgriLin", :line_of_business => "Centro de Acopio",
  		:commune_id => 117, :address => "Valentin Letelier 243", :email => "contaco@agrilin.cl", :phone => "075-2345187",
  		:contact => "Fax: 075-2435621", :sag_code => "ACT324v3", :active => true, :is_deleted => false, :code => 1, :company_id => 1)
  	p1.save(:validate => false)

  	p2 = Producer.new(:rut => "23829876-8", :name => "AgriCau", :line_of_business => "Centro de Acopio",
  		:commune_id => 117, :address => "O'higgins 243", :email => "contaco@agricau.cl", :phone => "075-2345187",
  		:contact => "Fax: 075-2435621", :sag_code => "ACT123v3", :active => true, :is_deleted => false, :code => 1, :company_id => 1)
  	p2.save(:validate => false)
  	
  	p3= Producer.new(:rut => "10842415-k", :name => "AgriTal", :line_of_business => "Centro de Acopio",
  		:commune_id => 117, :address => "Parque Industrial 243", :email => "contaco@agrital.cl", :phone => "075-2345187",
  		:contact => "Fax: 075-2435621", :sag_code => "ACT124v3", :active => true, :is_deleted => false, :code => 1, :company_id => 1)
  	p3.save(:validate => false)

  	p4 = Producer.new(:rut => "20040603-6", :name => "AgriMau", :line_of_business => "Centro de Acopio",
  		:commune_id => 117, :address => "Emma Jauch 243", :email => "contaco@agrimau.cl", :phone => "075-2345187",
  		:contact => "Fax: 075-2435621", :sag_code => "ACT125v3", :active => true, :is_deleted => false, :code => 1, :company_id => 1)
  	p4.save(:validate => false)

  	p5 = Producer.new(:rut => "13857191-2", :name => "AgriCur", :line_of_business => "Centro de Acopio",
  		:commune_id => 117, :address => "Camino a Romeral 243", :email => "contaco@agricur.cl", :phone => "075-2345187",
  		:contact => "Fax: 075-2435621", :sag_code => "ACT126v3", :active => true, :is_deleted => false, :code => 1, :company_id => 1)
  	p5.save(:validate => false)

    p6 = Producer.new(:rut => "11368812-2", :name => "AgriTal", :line_of_business => "Centro de Acopio",
      :commune_id => 117, :address => "Av. Lautaro 432", :email => "contaco@agrital.cl", :phone => "075-2345187",
      :contact => "Fax: 075-2435621", :sag_code => "ACT127v3", :active => true, :is_deleted => false, :code => 1, :company_id => 1)
    p6.save(:validate => false)




    p7 = Producer.new(:rut => "12110828-3", :name => "AgriLin", :line_of_business => "Centro de Acopio",
      :commune_id => 117, :address => "Valentin Letelier 243", :email => "contaco@agrilin.cl", :phone => "075-2345187",
      :contact => "Fax: 075-2435621", :sag_code => "ACT324v3", :active => true, :is_deleted => false, :code => 1, :company_id => 2)
    p7.save(:validate => false)

    p8 = Producer.new(:rut => "23829876-8", :name => "AgriCau", :line_of_business => "Centro de Acopio",
      :commune_id => 117, :address => "O'higgins 243", :email => "contaco@agricau.cl", :phone => "075-2345187",
      :contact => "Fax: 075-2435621", :sag_code => "ACT123v3", :active => true, :is_deleted => false, :code => 1, :company_id => 2)
    p8.save(:validate => false)
    
    p9= Producer.new(:rut => "10842415-k", :name => "AgriTal", :line_of_business => "Centro de Acopio",
      :commune_id => 117, :address => "Parque Industrial 243", :email => "contaco@agrital.cl", :phone => "075-2345187",
      :contact => "Fax: 075-2435621", :sag_code => "ACT124v3", :active => true, :is_deleted => false, :code => 1, :company_id => 2)
    p9.save(:validate => false)

    p10 = Producer.new(:rut => "20040603-6", :name => "AgriMau", :line_of_business => "Centro de Acopio",
      :commune_id => 117, :address => "Emma Jauch 243", :email => "contaco@agrimau.cl", :phone => "075-2345187",
      :contact => "Fax: 075-2435621", :sag_code => "ACT125v3", :active => true, :is_deleted => false, :code => 1, :company_id => 2)
    p10.save(:validate => false)

    p11 = Producer.new(:rut => "13857191-2", :name => "AgriCur", :line_of_business => "Centro de Acopio",
      :commune_id => 117, :address => "Camino a Romeral 243", :email => "contaco@agricur.cl", :phone => "075-2345187",
      :contact => "Fax: 075-2435621", :sag_code => "ACT126v3", :active => true, :is_deleted => false, :code => 1, :company_id => 2)
    p11.save(:validate => false)

    p12 = Producer.new(:rut => "11368812-2", :name => "AgriTal", :line_of_business => "Centro de Acopio",
      :commune_id => 117, :address => "Av. Lautaro 432", :email => "contaco@agrital.cl", :phone => "075-2345187",
      :contact => "Fax: 075-2435621", :sag_code => "ACT127v3", :active => true, :is_deleted => false, :code => 1, :company_id => 2)
    p12.save(:validate => false)

  	#Agregar Destinos
  	
  	d1 = Destination.new(:rut => "14466583-k", :name => "DistLin", :commune_id => 121, :address => "Yungay 243", 
  		:email => "contaco@distlin.cl", :phone => "073-2345187", :contact => "Fax: 073-2435621", :company_id => 1)
  	d1.save(:validate => false)

  	d2 = Destination.new(:rut => "11464929-5", :name => "DistCau", :commune_id => 112, :address => "Camino Rural 243", 
  		:email => "contaco@distcau.cl", :phone => "074-2345187", :contact => "Fax: 074-2435621", :company_id => 1)
  	d2.save(:validate => false)

    d3 = Destination.new(:rut => "7879337-6", :name => "DistTal", :commune_id => 137, :address => "Camino Viejo a Maule 243", 
  		:email => "contaco@distal.cl", :phone => "071-2345187", :contact => "Fax: 071-2435621", :company_id => 1)
  	d3.save(:validate => false)

  	d4 = Destination.new(:rut => "12710258-9", :name => "DistMau", :commune_id => 123, :address => "Serrano 243", 
  		:email => "contaco@distmau.cl", :phone => "072-2345187", :contact => "Fax: 072-2435621", :company_id => 1)
  	d4.save(:validate => false)

  	d5 = Destination.new(:rut => "12710258-9", :name => "DistCur", :commune_id => 117, :address => "Circunvalacion 243", 
  		:email => "contaco@distcur.cl", :phone => "075-2345187", :contact => "Fax: 075-2435621", :company_id => 1)
  	d5.save(:validate => false)



    d6 = Destination.new(:rut => "14466583-k", :name => "DistLin", :commune_id => 121, :address => "Yungay 243", 
      :email => "contaco@distlin.cl", :phone => "073-2345187", :contact => "Fax: 073-2435621", :company_id => 2)
    d6.save(:validate => false)

    d7 = Destination.new(:rut => "11464929-5", :name => "DistCau", :commune_id => 112, :address => "Camino Rural 243", 
      :email => "contaco@distcau.cl", :phone => "074-2345187", :contact => "Fax: 074-2435621", :company_id => 2)
    d7.save(:validate => false)

    d8 = Destination.new(:rut => "7879337-6", :name => "DistTal", :commune_id => 137, :address => "Camino Viejo a Maule 243", 
      :email => "contaco@distal.cl", :phone => "071-2345187", :contact => "Fax: 071-2435621", :company_id => 2)
    d8.save(:validate => false)

    d9 = Destination.new(:rut => "12710258-9", :name => "DistMau", :commune_id => 123, :address => "Serrano 243", 
      :email => "contaco@distmau.cl", :phone => "072-2345187", :contact => "Fax: 072-2435621", :company_id => 2)
    d9.save(:validate => false)

    d10 = Destination.new(:rut => "12710258-9", :name => "DistCur", :commune_id => 117, :address => "Circunvalacion 243", 
      :email => "contaco@distcur.cl", :phone => "075-2345187", :contact => "Fax: 075-2435621", :company_id => 2)
    d10.save(:validate => false)

  	

  	#Agregar Especies
  	
  	k1 = Kind.new(:name => "Futilla")
  	k1.save(:validate => false, :company_id => 1)
  	k2 = Kind.new(:name => "Frambuesa")
  	k2.save(:validate => false, :company_id => 1)
  	k3 = Kind.new(:name => "Manzana")
  	k3.save(:validate => false, :company_id => 1)
  	k4 = Kind.new(:name => "Cereza")
  	k4.save(:validate => false, :company_id => 1)
  	k5 = Kind.new(:name => "Uva")
  	k5.save(:validate => false, :company_id => 1)

    k6 = Kind.new(:name => "Futilla")
    k6.save(:validate => false, :company_id => 2)
    k7 = Kind.new(:name => "Frambuesa")
    k7.save(:validate => false, :company_id => 2)
    k8 = Kind.new(:name => "Manzana")
    k8.save(:validate => false, :company_id => 2)
    k9 = Kind.new(:name => "Cereza")
    k9.save(:validate => false, :company_id => 2)
    k10 = Kind.new(:name => "Uva")
    k10.save(:validate => false, :company_id => 2)
  	
  	#Agregar Variedades
  	
  	v1k1= Variety.new(:name => "Camarosa", :kind_id => k1.id, :company_id => k1.company_id)
  	v1k1.save(:validate => false)
  	v2k1= Variety.new(:name => "Camino Real", :kind_id => k1.id, :company_id => k1.company_id)
  	v2k1.save(:validate => false)
  	v3k1= Variety.new(:name => "Diamante", :kind_id => k1.id, :company_id => k1.company_id)
  	v3k1.save(:validate => false)

  	v1k2= Variety.new(:name => "Chilliwak", :kind_id => k2.id, :company_id => k2.company_id)
  	v1k2.save(:validate => false)
  	v2k2= Variety.new(:name => "Ruby", :kind_id => k2.id, :company_id => k2.company_id)
  	v2k2.save(:validate => false)
  	v3k2= Variety.new(:name => "Titan", :kind_id => k2.id, :company_id => k2.company_id)
  	v3k2.save(:validate => false)

  	v1k3= Variety.new(:name => "Royal Gala", :kind_id => k3.id, :company_id => k3.company_id)
  	v1k3.save(:validate => false)
  	v2k3= Variety.new(:name => "Fuji", :kind_id => k3.id, :company_id => k3.company_id)
  	v2k3.save(:validate => false)
  	v3k3= Variety.new(:name => "Empire", :kind_id => k3.id, :company_id => k3.company_id)
  	v3k3.save(:validate => false)

  	v1k4= Variety.new(:name => "Sweet Heart", :kind_id => k4.id, :company_id => k4.company_id)
  	v1k4.save(:validate => false)
  	v2k4= Variety.new(:name => "Newstar", :kind_id => k4.id, :company_id => k4.company_id)
  	v2k4.save(:validate => false)
  	v3k4= Variety.new(:name => "Cristalina", :kind_id => k4.id, :company_id => k4.company_id)
  	v3k4.save(:validate => false)

  	v1k5= Variety.new(:name => "Black Rose", :kind_id => k5.id, :company_id => k5.company_id)
  	v1k5.save(:validate => false)
  	v2k5= Variety.new(:name => "Calmeria", :kind_id => k5.id, :company_id => k5.company_id)
  	v2k5.save(:validate => false)
  	v3k5= Variety.new(:name => "Valencia", :kind_id => k5.id, :company_id => k5.company_id)
  	v3k5.save(:validate => false)

  	#Agregar Tipos de Envase

  	e1 = PackType.new(:name => "Envase Frutilla", :tare => 0.56)
  	e1.save(:validate => false, :company_id => 1)
  	e2 = PackType.new(:name => "Envase Frambuesa", :tare => 0.56)
  	e2.save(:validate => false, :company_id => 1)
  	e3 = PackType.new(:name => "Envase Manzana", :tare => 0.89)
  	e3.save(:validate => false, :company_id => 1)
  	e4 = PackType.new(:name => "Envase Cereza", :tare => 0.56)
  	e4.save(:validate => false, :company_id => 1)
  	e5 = PackType.new(:name => "Envase Uva", :tare => 0.56)
  	e5.save(:validate => false, :company_id => 1)

    e6 = PackType.new(:name => "Envase Frutilla", :tare => 0.56)
    e6.save(:validate => false, :company_id => 2)
    e7 = PackType.new(:name => "Envase Frambuesa", :tare => 0.56)
    e7.save(:validate => false, :company_id => 2)
    e8 = PackType.new(:name => "Envase Manzana", :tare => 0.89)
    e8.save(:validate => false, :company_id => 2)
    e9 = PackType.new(:name => "Envase Cereza", :tare => 0.56)
    e9.save(:validate => false, :company_id => 2)
    e10 = PackType.new(:name => "Envase Uva", :tare => 0.56)
    e10.save(:validate => false, :company_id => 2)

  	#Agregar Calidades
  	
  	q1 = Quality.new(:name => "IQF", :company_id => 1)
  	q1.save(:validate => false)
  	q2 = Quality.new(:name => "BLOCK", :company_id => 1)
  	q2.save(:validate => false)
  	q3 = Quality.new(:name => "JUGO", :company_id => 1)
  	q3.save(:validate => false)

    q4 = Quality.new(:name => "IQF", :company_id => 2)
    q4.save(:validate => false)
    q5 = Quality.new(:name => "BLOCK", :company_id => 2)
    q5.save(:validate => false)
    q6 = Quality.new(:name => "JUGO", :company_id => 2)
    q6.save(:validate => false)

  	#Agregar los Ingresos y los detalles
  	
  	r1 = Receipt.new(:producer_id => p1.id, :kind_id => k1.id,
  					:receipt_datetime => "2013-04-03 05:13:35.433108", :company_id => p1.company_id)
  	r1.save(:validate => false)
  	r1d1 = PackGroupReceipt.new(:price_per_unit => 550, :quantity => 55, :gross_weight => 110,
  		:pack_type_id => e1.id, :variety_id => v1k1.id, :quality_id => q1.id, :receipt_id => r1.id, :company_id => q1.company_id)
  	r1d1.save(:validate => false)
  	r1d2 = PackGroupReceipt.new(:price_per_unit => 320, :quantity => 76, :gross_weight => 152,
  		:pack_type_id => e1.id, :variety_id => v1k1.id, :quality_id => q2.id, :receipt_id => r1.id, :company_id => q2.company_id)
  	r1d2.save(:validate => false)

    p1.kinds << k1
    p1.pack_types << e1

  	r2 = Receipt.new(:producer_id => p2.id, :kind_id => k2.id,
  					:receipt_datetime => "2013-04-23 05:13:35.433108", :company_id => p2.company_id)
  	r2.save(:validate => false)
  	r2d1 = PackGroupReceipt.new(:price_per_unit => 750, :quantity => 88, :gross_weight => 176,
  		:pack_type_id => e2.id, :variety_id => v1k2.id, :quality_id => q1.id, :receipt_id => r2.id, :company_id => q1.company_id)
  	r2d1.save(:validate => false)
  	r2d2 = PackGroupReceipt.new(:price_per_unit => 650, :quantity => 76, :gross_weight => 152,
  		:pack_type_id => e2.id, :variety_id => v1k2.id, :quality_id => q2.id, :receipt_id => r2.id, :company_id => q2.company_id)
  	r2d2.save(:validate => false)

    p2.kinds << k2
    p2.pack_types << e2

    r3 = Receipt.new(:producer_id => p3.id, :kind_id => k3.id,
  					:receipt_datetime => "2013-04-25 05:13:35.433108", :company_id => p3.company_id)
  	r3.save(:validate => false)
  	r3d1 = PackGroupReceipt.new(:price_per_unit => 370, :quantity => 150, :gross_weight => 750,
  		:pack_type_id => e3.id, :variety_id => v1k3.id, :quality_id => q1.id, :receipt_id => r3.id, :company_id => q1.company_id)
  	r3d1.save(:validate => false)
  	r3d2 = PackGroupReceipt.new(:price_per_unit => 90, :quantity => 230, :gross_weight => 1150,
  		:pack_type_id => e3.id, :variety_id => v1k3.id, :quality_id => q3.id, :receipt_id => r3.id, :company_id => q3.company_id)
  	r3d2.save(:validate => false)
  	r3d3 = PackGroupReceipt.new(:price_per_unit => 170, :quantity => 190, :gross_weight => 950,
  		:pack_type_id => e3.id, :variety_id => v1k3.id, :quality_id => q2.id, :receipt_id => r3.id, :company_id => q2.company_id)
  	r3d3.save(:validate => false)

    p3.kinds << k3
    p3.pack_types << e3

  	r4 = Receipt.new(:producer_id => p4.id, :kind_id => k4.id,
  					:receipt_datetime => "2013-04-25 05:13:35.433108", :company_id => p4.company_id)
  	r4.save(:validate => false)
  	r4d1 = PackGroupReceipt.new(:price_per_unit => 520, :quantity => 150, :gross_weight => 300,
  		:pack_type_id => e4.id, :variety_id => v1k4.id, :quality_id => q1.id, :receipt_id => r4.id, :company_id => q1.company_id)
  	r4d1.save(:validate => false)
  	r4d2 = PackGroupReceipt.new(:price_per_unit => 370, :quantity => 230, :gross_weight => 460,
  		:pack_type_id => e4.id, :variety_id => v1k4.id, :quality_id => q2.id, :receipt_id => r4.id, :company_id => q2.company_id)
  	r4d2.save(:validate => false)

    p4.kinds << k4
    p4.pack_types << e4
  	
  	r5 = Receipt.new(:producer_id => p5.id, :kind_id => k5.id,
  					:receipt_datetime => "2013-04-29 05:13:35.433108", :company_id => p5.company_id)
  	r5.save(:validate => false)
  	r5d1 = PackGroupReceipt.new(:price_per_unit => 580, :quantity => 214, :gross_weight => 321,
  		:pack_type_id => e5.id, :variety_id => v1k5.id, :quality_id => q1.id, :receipt_id => r5.id, :company_id => q1.company_id)
  	r5d1.save(:validate => false)
  	r5d2 = PackGroupReceipt.new(:price_per_unit => 390, :quantity => 220, :gross_weight => 330,
  		:pack_type_id => e5.id, :variety_id => v1k5.id, :quality_id => q2.id, :receipt_id => r5.id, :company_id => q2.company_id)
  	r5d2.save(:validate => false)

    p5.kinds << k5
    p5.pack_types << e5

  	#de nuevo lo mismo

  	r1 = Receipt.new(:producer_id => p1.id, :kind_id => k2.id,
  					:receipt_datetime => "2013-05-13 05:13:35.433108", :company_id => p1.company_id)
  	r1.save(:validate => false)
  	r1d1 = PackGroupReceipt.new(:price_per_unit => 415, :quantity => 55, :gross_weight => 110,
  		:pack_type_id => e2.id, :variety_id => v2k2.id, :quality_id => q2.id, :receipt_id => r1.id, :company_id => q2.company_id)
  	r1d1.save(:validate => false)
  	r1d2 = PackGroupReceipt.new(:price_per_unit => 279, :quantity => 76, :gross_weight => 152,
  		:pack_type_id => e2.id, :variety_id => v2k2.id, :quality_id => q3.id, :receipt_id => r1.id, :company_id => q3.company_id)
  	r1d2.save(:validate => false)

    p1.kinds << k2
    p1.pack_types << e2

  	r2 = Receipt.new(:producer_id => p2.id, :kind_id => k2.id,
  					:receipt_datetime => "2013-05-23 05:13:35.433108", :company_id => p2.company_id)
  	r2.save(:validate => false)
  	r2d1 = PackGroupReceipt.new(:price_per_unit => 450, :quantity => -88, :gross_weight => 176,
  		:pack_type_id => e2.id, :variety_id => v1k2.id, :quality_id => q2.id, :receipt_id => r2.id, :company_id => q2.company_id)
  	r2d1.save(:validate => false)
  	r2d2 = PackGroupReceipt.new(:price_per_unit => 290, :quantity => -76, :gross_weight => 152,
  		:pack_type_id => e2.id, :variety_id => v1k2.id, :quality_id => q3.id, :receipt_id => r2.id, :company_id => q3.company_id)
  	r2d2.save(:validate => false)

    r3 = Receipt.new(:producer_id => p3.id, :kind_id => k4.id,
  					:receipt_datetime => "2013-05-25 05:13:35.433108", :company_id => p3.company_id)
  	r3.save(:validate => false)
  	r3d1 = PackGroupReceipt.new(:price_per_unit => 620, :quantity => 150, :gross_weight => 300,
  		:pack_type_id => e4.id, :variety_id => v3k4.id, :quality_id => q1.id, :receipt_id => r3.id, :company_id => q1.company_id)
  	r3d1.save(:validate => false)
  	r3d2 = PackGroupReceipt.new(:price_per_unit => 476, :quantity => 230, :gross_weight => 460,
  		:pack_type_id => e4.id, :variety_id => v3k4.id, :quality_id => q3.id, :receipt_id => r3.id, :company_id => q3.company_id)
  	r3d2.save(:validate => false)
  	r3d3 = PackGroupReceipt.new(:price_per_unit => 234, :quantity => 190, :gross_weight => 380,
  		:pack_type_id => e4.id, :variety_id => v3k4.id, :quality_id => q2.id, :receipt_id => r3.id, :company_id => q2.company_id)
  	r3d3.save(:validate => false)

    p3.kinds << k4
    p3.pack_types << e4

  	r4 = Receipt.new(:producer_id => p4.id, :kind_id => k4.id,
  					:receipt_datetime => "2013-05-26 05:13:35.433108", :company_id => p4.company_id)
  	r4.save(:validate => false)
  	r4d1 = PackGroupReceipt.new(:price_per_unit => 420, :quantity => 150, :gross_weight => 300,
  		:pack_type_id => e4.id, :variety_id => v2k4.id, :quality_id => q1.id, :receipt_id => r4.id, :company_id => q1.company_id)
  	r4d1.save(:validate => false)
  	r4d2 = PackGroupReceipt.new(:price_per_unit => 270, :quantity => 230, :gross_weight => 460,
  		:pack_type_id => e4.id, :variety_id => v2k4.id, :quality_id => q2.id, :receipt_id => r4.id, :company_id => q2.company_id)
  	r4d2.save(:validate => false)

  	r5 = Receipt.new(:producer_id => p5.id, :kind_id => k2.id,
  					:receipt_datetime => "2013-05-29 05:13:35.433108", :company_id => p5.company_id)
  	r5.save(:validate => false)
  	r5d1 = PackGroupReceipt.new(:price_per_unit => 440, :quantity => 214, :gross_weight => 428,
  		:pack_type_id => e2.id, :variety_id => v3k2.id, :quality_id => q1.id, :receipt_id => r5.id, :company_id => q1.company_id)
  	r5d1.save(:validate => false)
  	r5d2 = PackGroupReceipt.new(:price_per_unit => 390, :quantity => 220, :gross_weight => 440,
  		:pack_type_id => e2.id, :variety_id => v3k2.id, :quality_id => q2.id, :receipt_id => r5.id, :company_id => q2.company_id)
  	r5d2.save(:validate => false)

    p5.kinds << k2
    p5.pack_types << e2

  	#y otra vez

  	r1 = Receipt.new(:producer_id => p1.id, :kind_id => k1.id,
  					:receipt_datetime => "2013-05-30 05:13:35.433108", :company_id => p1.company_id)
  	r1.save(:validate => false)
  	r1d1 = PackGroupReceipt.new(:price_per_unit => 530, :quantity => 55, :gross_weight => 110,
  		:pack_type_id => e1.id, :variety_id => v2k1.id, :quality_id => q1.id, :receipt_id => r1.id, :company_id => q1.company_id)
  	r1d1.save(:validate => false)
  	r1d2 = PackGroupReceipt.new(:price_per_unit => 380, :quantity => 76, :gross_weight => 152,
  		:pack_type_id => e1.id, :variety_id => v2k1.id, :quality_id => q2.id, :receipt_id => r1.id, :company_id => q2.company_id)
  	r1d2.save(:validate => false)

  	r2 = Receipt.new(:producer_id => p2.id, :kind_id => k2.id,
  					:receipt_datetime => "2013-05-31 05:13:35.433108", :company_id => p2.company_id)
  	r2.save(:validate => false)
  	r2d1 = PackGroupReceipt.new(:price_per_unit => 480, :quantity => 90, :gross_weight => 180,
  		:pack_type_id => e2.id, :variety_id => v2k2.id, :quality_id => q1.id, :receipt_id => r2.id, :company_id => q1.company_id)
  	r2d1.save(:validate => false)
  	r2d2 = PackGroupReceipt.new(:price_per_unit => 310, :quantity => 80, :gross_weight => 160,
  		:pack_type_id => e2.id, :variety_id => v2k2.id, :quality_id => q2.id, :receipt_id => r2.id, :company_id => q2.company_id)
  	r2d2.save(:validate => false)

    r3 = Receipt.new(:producer_id => p3.id, :kind_id => k3.id,
  					:receipt_datetime => "2013-06-01 05:13:35.433108", :company_id => p3.company_id)
  	r3.save(:validate => false)
  	r3d1 = PackGroupReceipt.new(:price_per_unit => 370, :quantity => 100, :gross_weight => 300,
  		:pack_type_id => e3.id, :variety_id => v3k3.id, :quality_id => q1.id, :receipt_id => r3.id, :company_id => q1.company_id)
  	r3d1.save(:validate => false)
  	r3d2 = PackGroupReceipt.new(:price_per_unit => 90, :quantity => 210, :gross_weight => 630,
  		:pack_type_id => e3.id, :variety_id => v3k3.id, :quality_id => q3.id, :receipt_id => r3.id, :company_id => q3.company_id)
  	r3d2.save(:validate => false)
  	r3d3 = PackGroupReceipt.new(:price_per_unit => 170, :quantity => 150, :gross_weight => 450,
  		:pack_type_id => e3.id, :variety_id => v3k3.id, :quality_id => q2.id, :receipt_id => r3.id, :company_id => q2.company_id)
  	r3d3.save(:validate => false)

  	r4 = Receipt.new(:producer_id => p4.id, :kind_id => k1.id,
  					:receipt_datetime => "2013-06-02 05:13:35.433108", :company_id => p4.company_id)
  	r4.save(:validate => false)
  	r4d1 = PackGroupReceipt.new(:price_per_unit => 520, :quantity => 150, :gross_weight => 300,
  		:pack_type_id => e1.id, :variety_id => v3k1.id, :quality_id => q1.id, :receipt_id => r4.id, :company_id => q1.company_id)
  	r4d1.save(:validate => false)
  	r4d2 = PackGroupReceipt.new(:price_per_unit => 370, :quantity => 230, :gross_weight => 460,
  		:pack_type_id => e1.id, :variety_id => v3k1.id, :quality_id => q3.id, :receipt_id => r4.id, :company_id => q3.company_id)
  	r4d2.save(:validate => false)

    p4.kinds << k1
    p4.pack_types << e1
  	
  	r5 = Receipt.new(:producer_id => p5.id, :kind_id => k5.id,
  					:receipt_datetime => "2013-06-02 05:13:35.433108", :company_id => p5.company_id)
  	r5.save(:validate => false)
  	r5d1 = PackGroupReceipt.new(:price_per_unit => 380, :quantity => 214, :gross_weight => 321,
  		:pack_type_id => e5.id, :variety_id => v3k5.id, :quality_id => q2.id, :receipt_id => r5.id, :company_id => q2.company_id)
  	r5d1.save(:validate => false)
  	r5d2 = PackGroupReceipt.new(:price_per_unit => 179, :quantity => 220, :gross_weight => 330,
  		:pack_type_id => e5.id, :variety_id => v3k5.id, :quality_id => q3.id, :receipt_id => r5.id, :company_id => q3.company_id)
  	r5d2.save(:validate => false)


    #ingresos con pallet

    r1 = Receipt.new(:producer_id => p1.id, :kind_id => k1.id,
            :receipt_datetime => "2013-05-30 05:13:35.433108", :company_id => p1.company_id)
    r1.save(:validate => false)

    pallet = Pallet.new(:quantity => 80, :price_per_unit => 345, :gross_weight => 160,
      :tare => 15, :variety_id => v3k1.id, :quality_id => q2.id, :receipt_id => r1.id, :pack_type_id => e1.id, :company_id => q2.company_id)
    pallet.save(:validate => false)

    r2 = Receipt.new(:producer_id => p2.id, :kind_id => k2.id,
            :receipt_datetime => "2013-05-31 05:13:35.433108", :company_id => p2.company_id)
    r2.save(:validate => false)
    pallet = Pallet.new(:quantity => 110, :price_per_unit => 200, :gross_weight => 220,
      :tare => 15, :variety_id => v2k2.id, :quality_id => q3.id, :receipt_id => r2.id, :pack_type_id => e2.id, :company_id => q3.company_id)
    pallet.save(:validate => false)
    

    r3 = Receipt.new(:producer_id => p3.id, :kind_id => k3.id,
            :receipt_datetime => "2013-06-01 05:13:35.433108", :company_id => 2)
    r3.save(:validate => false)

    pallet = Pallet.new(:quantity => 50, :price_per_unit => 156, :gross_weight => 150,
      :tare => 15, :variety_id => v2k3.id, :quality_id => q3.id, :receipt_id => r3.id, :pack_type_id => e3.id, :company_id => q3.company_id)
    pallet.save(:validate => false)
    pallet = Pallet.new(:quantity => 60, :price_per_unit => 250, :gross_weight => 180,
      :tare => 15, :variety_id => v2k3.id, :quality_id => q2.id, :receipt_id => r3.id, :pack_type_id => e3.id, :company_id => q2.company_id)
    pallet.save(:validate => false)

  	#Agregamos los Despachos y sus detalles

  	dp1 = Dispatch.new(:destination_id => d1.id, :kind_id => k1.id,
  		:dispatch_datetime => "2013-04-02 05:13:35.433108", :company_id => d1.company_id)
  	dp1.save(:validate => false)
  	dp1d1 = PackGroupDispatch.new(:gross_weight => 240, :quantity => 120, :variety_id => v1k1.id,
  			:quality_id => q1.id, :dispatch_id => dp1.id, :pack_type_id => e1.id, :company_id => dp1.company_id)
  	dp1d1.save(:validate => false)
  	dp1d2 = PackGroupDispatch.new(:gross_weight => 300, :quantity => 150, :variety_id => v1k1.id,
  			:quality_id => q2.id, :dispatch_id => dp1.id, :pack_type_id => e1.id, :company_id => dp1.company_id)
  	dp1d2.save(:validate => false)

  	dp2 = Dispatch.new(:destination_id => d2.id, :kind_id => k2.id,
  		:dispatch_datetime => "2013-04-07 05:13:35.433108", :company_id => d2.company_id)
  	dp2.save(:validate => false)
  	dp2d1 = PackGroupDispatch.new(:gross_weight => 240, :quantity => 120, :variety_id => v1k2.id,
  			:quality_id => q1.id, :dispatch_id => dp2.id, :pack_type_id => e2.id, :company_id => dp2.company_id)
  	dp2d1.save(:validate => false)
  	dp2d2 = PackGroupDispatch.new(:gross_weight => 300, :quantity => 150, :variety_id => v1k2.id,
  			:quality_id => q2.id, :dispatch_id => dp2.id, :pack_type_id => e2.id, :company_id => dp2.company_id)
  	dp2d2.save(:validate => false)

  	dp3 = Dispatch.new(:destination_id => d3.id, :kind_id => k3.id,
  		:dispatch_datetime => "2013-04-15 05:13:35.433108", :company_id => d3.company_id)
  	dp3.save(:validate => false)
  	dp3d1 = PackGroupDispatch.new(:gross_weight => 240, :quantity => 120, :variety_id => v1k3.id,
  			:quality_id => q1.id, :dispatch_id => dp3.id, :pack_type_id => e3.id, :company_id => dp3.company_id)
  	dp3d1.save(:validate => false)
  	dp3d2 = PackGroupDispatch.new(:gross_weight => 300, :quantity => 150, :variety_id => v1k3.id,
  			:quality_id => q2.id, :dispatch_id => dp3.id, :pack_type_id => e3.id, :company_id => dp3.company_id)
  	dp3d2.save(:validate => false)
  	dp3d3 = PackGroupDispatch.new(:gross_weight => 120, :quantity => 60, :variety_id => v1k3.id,
  			:quality_id => q3.id, :dispatch_id => dp3.id, :pack_type_id => e3.id, :company_id => dp3.company_id)
  	dp3d3.save(:validate => false)

  	dp4 = Dispatch.new(:destination_id => d4.id, :kind_id => k4.id,
  		:dispatch_datetime => "2013-04-24 05:13:35.433108", :company_id => d4.company_id)
  	dp4.save(:validate => false)
  	dp4d1 = PackGroupDispatch.new(:gross_weight => 240, :quantity => 120, :variety_id => v1k4.id,
  			:quality_id => q1.id, :dispatch_id => dp4.id, :pack_type_id => e4.id, :company_id => dp4.company_id)
  	dp4d1.save(:validate => false)
  	dp4d2 = PackGroupDispatch.new(:gross_weight => 300, :quantity => 150, :variety_id => v1k4.id,
  			:quality_id => q2.id, :dispatch_id => dp4.id, :pack_type_id => e4.id, :company_id => dp4.company_id)
  	dp4d2.save(:validate => false)

  	dp5 = Dispatch.new(:destination_id => d5.id, :kind_id => k5.id,
  		:dispatch_datetime => "2013-04-26 05:13:35.433108", :company_id => d5.company_id)
  	dp5.save(:validate => false)
  	dp5d1 = PackGroupDispatch.new(:gross_weight => 240, :quantity => 120, :variety_id => v1k5.id,
  			:quality_id => q1.id, :dispatch_id => dp5.id, :pack_type_id => e5.id, :company_id => dp5.company_id)
  	dp5d1.save(:validate => false)
  	dp5d2 = PackGroupDispatch.new(:gross_weight => 300, :quantity => 150, :variety_id => v1k5.id,
  			:quality_id => q2.id, :dispatch_id => dp5.id, :pack_type_id => e5.id, :company_id => dp5.company_id)
  	dp5d2.save(:validate => false)

  	#y de nuevo
  	dp1 = Dispatch.new(:destination_id => d1.id, :kind_id => k1.id,
  		:dispatch_datetime => "2013-05-02 05:13:35.433108", :company_id => d1.company_id)
  	dp1.save(:validate => false)
  	dp1d1 = PackGroupDispatch.new(:gross_weight => 240, :quantity => 120, :variety_id => v1k1.id,
  			:quality_id => q1.id, :dispatch_id => dp1.id, :pack_type_id => e1.id, :company_id => dp1.company_id)
  	dp1d1.save(:validate => false)
  	dp1d2 = PackGroupDispatch.new(:gross_weight => 300, :quantity => 150, :variety_id => v1k1.id,
  			:quality_id => q2.id, :dispatch_id => dp1.id, :pack_type_id => e1.id, :company_id => dp1.company_id)
  	dp1d2.save(:validate => false)

  	dp2 = Dispatch.new(:destination_id => d2.id, :kind_id => k2.id,
  		:dispatch_datetime => "2013-05-07 05:13:35.433108", :company_id => d2.company_id)
  	dp2.save(:validate => false)
  	dp2d1 = PackGroupDispatch.new(:gross_weight => 240, :quantity => 120, :variety_id => v1k2.id,
  			:quality_id => q1.id, :dispatch_id => dp2.id, :pack_type_id => e2.id, :company_id => dp2.company_id)
  	dp2d1.save(:validate => false)
  	dp2d2 = PackGroupDispatch.new(:gross_weight => 300, :quantity => 150, :variety_id => v1k2.id,
  			:quality_id => q2.id, :dispatch_id => dp2.id, :pack_type_id => e2.id, :company_id => dp2.company_id)
  	dp2d2.save(:validate => false)

  	dp3 = Dispatch.new(:destination_id => d3.id, :kind_id => k3.id,
  		:dispatch_datetime => "2013-05-15 05:13:35.433108", :company_id => d3.company_id)
  	dp3.save(:validate => false)
  	dp3d1 = PackGroupDispatch.new(:gross_weight => 240, :quantity => 120, :variety_id => v1k3.id,
  			:quality_id => q1.id, :dispatch_id => dp3.id, :pack_type_id => e3.id, :company_id => dp3.company_id)
  	dp3d1.save(:validate => false)
  	dp3d2 = PackGroupDispatch.new(:gross_weight => 300, :quantity => 150, :variety_id => v1k3.id,
  			:quality_id => q2.id, :dispatch_id => dp3.id, :pack_type_id => e3.id, :company_id => dp3.company_id)
  	dp3d2.save(:validate => false)
  	dp3d3 = PackGroupDispatch.new(:gross_weight => 120, :quantity => 60, :variety_id => v1k3.id,
  			:quality_id => q3.id, :dispatch_id => dp3.id, :pack_type_id => e3.id, :company_id => dp3.company_id)
  	dp3d3.save(:validate => false)

  	dp4 = Dispatch.new(:destination_id => d4.id, :kind_id => k1.id,
  		:dispatch_datetime => "2013-05-24 05:13:35.433108", :company_id => d4.company_id)
  	dp4.save(:validate => false)
  	dp4d1 = PackGroupDispatch.new(:gross_weight => 240, :quantity => 120, :variety_id => v2k1.id,
  			:quality_id => q1.id, :dispatch_id => dp4.id, :pack_type_id => e1.id, :company_id => dp4.company_id)
  	dp4d1.save(:validate => false)
  	dp4d2 = PackGroupDispatch.new(:gross_weight => 300, :quantity => 150, :variety_id => v2k1.id,
  			:quality_id => q2.id, :dispatch_id => dp4.id, :pack_type_id => e1.id, :company_id => dp4.company_id)
  	dp4d2.save(:validate => false)

  	dp5 = Dispatch.new(:destination_id => d5.id, :kind_id => k2.id,
  		:dispatch_datetime => "2013-05-26 05:13:35.433108", :company_id => d5.company_id)
  	dp5.save(:validate => false)
  	dp5d1 = PackGroupDispatch.new(:gross_weight => 240, :quantity => 120, :variety_id => v3k2.id,
  			:quality_id => q1.id, :dispatch_id => dp5.id, :pack_type_id => e2.id, :company_id => dp5.company_id)
  	dp5d1.save(:validate => false)
  	dp5d2 = PackGroupDispatch.new(:gross_weight => 300, :quantity => 150, :variety_id => v3k2.id,
  			:quality_id => q2.id, :dispatch_id => dp5.id, :pack_type_id => e2.id, :company_id => dp5.company_id)
  	dp5d2.save(:validate => false)

  	#y otra vez

  	dp1 = Dispatch.new(:destination_id => d1.id, :kind_id => k1.id,
  		:dispatch_datetime => "2013-05-30 05:13:35.433108", :company_id => d1.company_id)
  	dp1.save(:validate => false)
  	dp1d1 = PackGroupDispatch.new(:gross_weight => 240, :quantity => 120, :variety_id => v2k1.id,
  			:quality_id => q1.id, :dispatch_id => dp1.id, :pack_type_id => e1.id, :company_id => dp1.company_id)
  	dp1d1.save(:validate => false)
  	dp1d2 = PackGroupDispatch.new(:gross_weight => 300, :quantity => 150, :variety_id => v2k1.id,
  			:quality_id => q2.id, :dispatch_id => dp1.id, :pack_type_id => e1.id, :company_id => dp1.company_id)
  	dp1d2.save(:validate => false)

  	dp2 = Dispatch.new(:destination_id => d2.id, :kind_id => k3.id,
  		:dispatch_datetime => "2013-05-30 05:13:35.433108", :company_id => d2.company_id)
  	dp2.save(:validate => false)
  	dp2d1 = PackGroupDispatch.new(:gross_weight => 240, :quantity => 120, :variety_id => v2k3.id,
  			:quality_id => q1.id, :dispatch_id => dp2.id, :pack_type_id => e3.id, :company_id => dp2.company_id)
  	dp2d1.save(:validate => false)
  	dp2d2 = PackGroupDispatch.new(:gross_weight => 300, :quantity => 150, :variety_id => v2k3.id,
  			:quality_id => q2.id, :dispatch_id => dp2.id, :pack_type_id => e3.id, :company_id => dp2.company_id)
  	dp2d2.save(:validate => false)

  	dp3 = Dispatch.new(:destination_id => d3.id, :kind_id => k5.id,
  		:dispatch_datetime => "2013-06-01 05:13:35.433108", :company_id => d3.company_id)
  	dp3.save(:validate => false)
  	dp3d1 = PackGroupDispatch.new(:gross_weight => 240, :quantity => 120, :variety_id => v3k5.id,
  			:quality_id => q1.id, :dispatch_id => dp3.id, :pack_type_id => e5.id, :company_id => dp3.company_id)
  	dp3d1.save(:validate => false)
  	dp3d2 = PackGroupDispatch.new(:gross_weight => 300, :quantity => 150, :variety_id => v3k5.id,
  			:quality_id => q2.id, :dispatch_id => dp3.id, :pack_type_id => e5.id, :company_id => dp3.company_id)
  	dp3d2.save(:validate => false)

  	dp4 = Dispatch.new(:destination_id => d4.id, :kind_id => k4.id,
  		:dispatch_datetime => "2013-06-02 05:13:35.433108", :company_id => d4.company_id)
  	dp4.save(:validate => false)
  	dp4d1 = PackGroupDispatch.new(:gross_weight => 240, :quantity => 120, :variety_id => v3k4.id,
  			:quality_id => q1.id, :dispatch_id => dp4.id, :pack_type_id => e4.id, :company_id => dp4.company_id)
  	dp4d1.save(:validate => false)
  	dp4d2 = PackGroupDispatch.new(:gross_weight => 300, :quantity => 150, :variety_id => v3k4.id,
  			:quality_id => q2.id, :dispatch_id => dp4.id, :pack_type_id => e4.id, :company_id => dp4.company_id)
  	dp4d2.save(:validate => false)

  	dp5 = Dispatch.new(	:destination_id => d5.id, :kind_id => k5.id,
  		:dispatch_datetime => "2013-06-02 05:13:35.433108", :company_id => d5.company_id)
  	dp5.save(:validate => false)
  	dp5d1 = PackGroupDispatch.new(:gross_weight => 240, :quantity => 120, :variety_id => v2k5.id,
  			:quality_id => q1.id, :dispatch_id => dp5.id, :pack_type_id => e5.id, :company_id => dp5.company_id)
  	dp5d1.save(:validate => false)
  	dp5d2 = PackGroupDispatch.new(:gross_weight => 300, :quantity => 150, :variety_id => v2k5.id,
  			:quality_id => q2.id, :dispatch_id => dp5.id, :pack_type_id => e5.id, :company_id => dp5.company_id)
  	dp5d2.save(:validate => false)

    #despachos con pallets

    dp1 = Dispatch.new(:destination_id => d1.id, :kind_id => k1.id,
      :dispatch_datetime => "2013-05-30 05:13:35.433108", :company_id => d1.company_id)
    dp1.save(:validate => false)

    pallet = Pallet.new(:quantity => 50, :price_per_unit => 156, :gross_weight => 150,
      :tare => 15, :variety_id => v2k1.id, :quality_id => q3.id, :dispatch_id => dp1.id, :pack_type_id => e1.id, :company_id => dp1.company_id)
    pallet.save(:validate => false)
    pallet = Pallet.new(:quantity => 60, :price_per_unit => 250, :gross_weight => 180,
      :tare => 15, :variety_id => v2k1.id, :quality_id => q2.id, :dispatch_id => dp1.id, :pack_type_id => e1.id, :company_id => dp1.company_id)
    pallet.save(:validate => false)

    dp2 = Dispatch.new(:destination_id => d2.id, :kind_id => k2.id,
      :dispatch_datetime => "2013-05-30 05:13:35.433108", :company_id => d2.company_id)
    dp2.save(:validate => false)

    pallet = Pallet.new(:quantity => 50, :price_per_unit => 156, :gross_weight => 150,
      :tare => 15, :variety_id => v2k2.id, :quality_id => q3.id, :dispatch_id => dp2.id, :pack_type_id => e2.id, :company_id => dp2.company_id)
    pallet.save(:validate => false)
    pallet = Pallet.new(:quantity => 60, :price_per_unit => 250, :gross_weight => 180,
      :tare => 15, :variety_id => v2k2.id, :quality_id => q2.id, :dispatch_id => dp2.id, :pack_type_id => e2.id, :company_id => dp2.company_id)
    pallet.save(:validate => false)

  end

end