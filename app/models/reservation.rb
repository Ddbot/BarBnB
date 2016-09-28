class Reservation < ActiveRecord::Base
	belongs_to :listing
	has_many :payments

	validates :start_date, presence: true
	validates :end_date, presence: true
	
	validate :date_is_valid?, :listing_is_available?

  
	def date_is_valid?
    if start_date.present? && start_date < Date.today
      @errors.add(:start_date,"can't be in the past")
    	return false
    end

		sd = start_date.to_datetime
		ed = end_date.to_datetime
		nd = Time.now	

		if (sd < ed)    
			return true 
		else
			@errors.add(:end_date, "cannot be before Start date.")
			return false
		end
	end

  def listing_is_available?
	  l_id = self.listing_id
  	reservation = Reservation.where("listing_id = ?", l_id)
  	desired_array = *(self.start_date..self.end_date)
  	booked_days = []  	

  	reservation.each do |r|
  		booked_array = *(r.start_date..r.end_date)  
			intersection =  (booked_array & desired_array)
			booked_days << intersection 	 
		end
	  if booked_days.flatten.empty?
	  	return true
  	else
	    self.errors.add(:start_date, "Not available at these dates. Please change your reservation dates.")  
		end
	end
end
