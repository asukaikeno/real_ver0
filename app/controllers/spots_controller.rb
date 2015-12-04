class SpotsController < ApplicationController
 
  def new
  	@spot = Spot.new
  end

  def create
    @spot = current_user.spot.build(spot_params)
  	   if @spot.save
         flash[:success] = "投稿しました！"
  		   redirect_to spots_url
  	   else
  	 	  render 'static_pages/home'
  	   end
  end


  def show
  	@spot = Spot.find(params[:id])
  end

  def index
    @spot = Spot.all
  end


   private
     def spot_params
       params.require(:spot).permit(:title, :context, :place, :cost, :link, :picture)
     end

     def correct_user
      @spot = current_user.spots.find_by(id: params[:id])
      redirect_to root_url if @spot.nil?
    end
end
