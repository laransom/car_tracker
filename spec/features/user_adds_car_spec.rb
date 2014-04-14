require 'spec_helper'

feature 'add a new car to lot listing', %q{
  As a car salesperson
  I want to record a newly acquired car
  So that I can list it in my lot
} do

  scenario 'successfully registers car with valid attributes' do
    pre_count = Car.count
    visit new_car_path

    fill_in 'Color', with: 'Black'
    fill_in 'Mileage', with: '14000'
    fill_in 'Year', with: '1998'
    fill_in 'Description', with: 'A classic with almost no logged miles!'

    click_on 'Record Car'

    expect(page).to have_content 'Car successfully added'
    expect(Car.count).to eq(pre_count + 1)
  end

end
