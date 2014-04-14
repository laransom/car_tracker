class CarsController < ApplicationController

  def new
    @car = Car.new
    @manufacturers = Manufacturer.all.map { |m| [m.name, m.id] }
  end

  def create
    @car = Car.new(car_params)

    if @car.save
      redirect_to new_car_path, notice: 'Car successfully added'
    else
      @manufacturers = Manufacturer.all.map { |m| [m.name, m.id] }
      render :new
    end
  end

  protected
  def car_params
    params.require(:car).permit(:color, :year, :mileage, :description, :manufacturer_id)
  end

end
