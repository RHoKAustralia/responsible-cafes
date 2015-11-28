module ApplicationHelper

	# Check if the current controller is an Admin
	# namespaced controller
	def admin_section?
		controller.class.name.split("::").first == "Admin"
	end

  def cafe_address(cafe)
    CGI.escape "#{@cafe.address_line_1} #{@cafe.address_line_2} #{@cafe.suburb}, #{@cafe.postcode}, #{@cafe.state}, Australia"
  end
end
