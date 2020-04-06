class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def enough_tickets?
        self.user.tickets > self.attraction.tickets
    end

    def tall_enough?
        self.user.height > self.attraction.min_height
    end

    def take_ride
        if !enough_tickets? && !tall_enough?
            "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif !tall_enough?
            "Sorry. You are not tall enough to ride the #{self.attraction.name}."
        elsif !enough_tickets?
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        else
            new_number_of_tickets = self.user.tickets - self.attraction.tickets
            new_nausea_level = self.user.nausea + self.attraction.nausea_rating
            new_happines_level = self.user.happiness + self.attraction.happiness_rating
            self.user.update(tickets: new_number_of_tickets, nausea: new_nausea_level, happiness: new_happines_level)
        end
    end
end
