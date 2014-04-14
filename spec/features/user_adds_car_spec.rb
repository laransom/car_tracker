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
    fill_in 'Year', with: car.year
    fill_in 'Mileage', with: car.mileage
    fill_in 'Description', with: car.description

    click_on 'Record Car'

    expect(page).to have_content 'Car successfully added'
    expect(Car.count).to eq(pre_count + 1)
  end


  scenario 'attempts to register car with blank attributes' do
    pre_count = Car.count

    click_on 'Record Car'

    within(:css, '.car_color') do
      expect(page).to have_content "can't be blank"
    end

    within(:css, '.car_year') do
      expect(page).to have_content "can't be blank"
    end

    within(:css, '.car_mileage') do
      expect(page).to have_content "can't be blank"
    end

    expect(Car.count).to eq(pre_count)

  end

  scenario 'attempts to register car with invalid attributes' do
    pre_count = Car.count

    fill_in 'Color', with: '5'
    fill_in 'Year', with: '400'
    fill_in 'Mileage', with: 'I like cars'

    click_on 'Record Car'

    within(:css, '.car_color') do
      expect(page).to have_content "is invalid"
    end

    within(:css, '.car_year') do
      expect(page).to have_content "must be greater than 1979"
    end

    within(:css, '.car_mileage') do
      expect(page).to have_content "is not a number"
    end

    expect(Car.count).to eq(pre_count)

  end

end
