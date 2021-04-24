class RestaurantsController < ApplicationController
    def index
        @restaurants = Restaurant.all
    end

    def show
        @restaurant = Restaurant.find(params[:id])
        @reviews = @restaurant.reviews
    end

    def create
        @restaurant = Restaurant.new(restaurant_params)
        if @restaurant.save
            redirect_to restaurant_path(@restaurant)
        else
            render :new
        end
    end

    def new
        @restaurant = Restaurant.new()
    end

    private

    def restaurant_params
        params.require(:restaurant).permit(:name, :category, :address, :phone_number)
    end
end
