require 'spec_helper'

feature 'optionally associate car with existing manufacturer', %q{
  As a car salesperson
  I want to record a car listing's manufacturer
  So that I can keep track of its manufacturer
} do

  scenario 'register new car with associated owner' do
    car = FactoryGirl.build(:car)
    manufacturer = FactoryGirl.create(:manufacturer)
    pre_count = Car.count
    visit new_car_path

    fill_in 'Color', with: car.color
    fill_in 'Year', with: car.year
    fill_in 'Mileage', with: car.mileage
    fill_in 'Description', with: car.description
    select manufacturer.name, from: 'Manufacturer'

    click_on 'Record Car'

    expect(page).to have_content 'Car successfully added'
    expect(Car.count).to eq(pre_count + 1)


  end

end
