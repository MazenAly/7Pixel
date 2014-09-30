class SalesTaxes

#hardcoded input
  INPUT1 = [ "1 book at 12.49", "1 music CD at 14.99", "1 chocolate bar at 0.85" ]
  INPUT2 = ["1 imported box of chocolates at 10.00", "1 imported bottle of perfume at 47.50"]
  INPUT3 = [ "1 imported bottle of perfume at 27.99", "1 bottle of perfume at 18.99", "1 packet of headache pills at 9.75", 
"1 box of imported chocolates at 11.25"]

#Basic sales tax is applicable at a rate of 10% on all goods, except books, food, and medical products that are exempt 
  EXEMPT_ITEMS = ["book","pills","chocolate"]  
  BASIC_TAXES = 0.10
  IMPORT_TAXES = 0.05

  
  def initialize
    puts "OUTPUT"
    puts 
    puts "OUTPUT1"
    input_details INPUT1
    puts
    puts "OUTPUT2"
    input_details INPUT2
    puts
    puts "OUTPUT3"
    input_details INPUT3
    puts
  end
  
  def input_details input_array
    total_taxes = 0
    total_price = 0
    input_array.each do |each_item|
       tokens = each_item.split
       price = tokens.last.to_f
       product = (each_item.split(" at ")).first.strip
       taxes = calulate_taxes  price,product
       taxed_price = (price.to_f + taxes) 
       puts "#{product}: #{'%.2f' % taxed_price}"
       total_taxes += taxes
       total_price += taxed_price
    end
    puts "Sales Taxes: #{'%.2f' % total_taxes}" 
    puts "Total: #{'%.2f' % total_price}"
  end
  
  def calulate_taxes price,product
    taxes = 0
    exempt = false 
    if product.include?("imported") 
    	taxes += price.to_f * IMPORT_TAXES   #apply import taxes if it's imported
    end 
    EXEMPT_ITEMS.each do |exempt_item|    #check if the product should be exempted from the basic taxes
	if product.include?(exempt_item)
		exempt= true
	end 
    end 
   unless exempt
	taxes += price.to_f * BASIC_TAXES
   end 
    return (taxes * 20).round / 20.0    #rounding to the nearest 0.05
  end
  
end

SalesTaxes.new
