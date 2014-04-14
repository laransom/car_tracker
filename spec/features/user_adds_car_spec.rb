require 'spec_helper'

feature 'add a new car to lot listing', %q{
  As a car salesperson
  I want to record a newly acquired car
  So that I can list it in my lot
} do

  before :each do
    visit new_car_path
  end

  scenario 'successfully registers car with valid attributes' do
    car = FactoryGirl.build(:car)
    pre_count = Car.count


    fill_in 'Color', with: car.color
    fill_in 'Mileage', with: car.mileage
    fill_in 'Year', with: car.year
    fill_in 'Description', with: car.description

    click_on 'Record Car'

    expect(page).to have_content 'Car successfully added'
    expect(Car.count).to eq(pre_count + 1)
  end


  scenario 'attempts to register car with invalid attributes' do
    pre_count = Car.count

    click_on 'Record Car'
    save_and_open_page

    within(:css, '')

  end

end
