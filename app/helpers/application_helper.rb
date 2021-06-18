module ApplicationHelper

  
  def city_list(locations)        
    @locations = locations
   
    @city_list_array = []
    @locations.each do |city|
      @city_list_array.push(city.address_city) unless @city_list_array.include?(city.address_city)
    end
    return @city_list_array
  end 
  
  def current_user_cart
    @cart = current_user.cart
    return @cart
  end
end
