class Eveniment < ApplicationRecord
    has_many :tours
    def tours_for_events
        # Aceasta poate depinde de logica specifică a aplicației tale
        self.tours.order(data_ora)
      end
end
