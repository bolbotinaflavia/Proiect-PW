class RezervariController < ApplicationController
  def index
    #@eveniments = Eveniment.all
   # @tours=Tour.all;
   @tours = Tour.where(data_ora: Time.now.beginning_of_month.beginning_of_week..Time.now.end_of_month.end_of_week);
	@eveniments = Eveniment.where(tours_id: Tour.ids);
  #   @tours = Tour.where(eveniment_id: Eveniment.ids)
    #@tours=Tour.where(data_ora: Time.now.beginning_of_month.beginning_of_week..Time.now.end_of_month.end_of_week)
    #@eveniments=Eveniment.find_by(id: @tours.all)
  end
  
end
