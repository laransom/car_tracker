class CarsController < ApplicationController

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)

    if @car.save
      redirect_to new_car_path, notice: 'Car successfully added'
    else

    end
  end

  protected
  def car_params
    params.require(:car).permit(:color, :year, :mileage, :description)
  end

end
