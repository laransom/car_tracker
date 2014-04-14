require 'spec_helper'

feature 'add a new manufacturer', %q{
  As a car salesperson
  I want to record a car manufacturer
  So that I can keep track of the types of cars found in the lot
} do

  before :each do
    visit new_manufacturer_path
  end

  scenario 'successfully registers manufacturer with valid attributes' do
    manufacturer = FactoryGirl.build(:manufacturer)
    pre_count = Manufacturer.count

    fill_in 'Name', with: manufacturer.name
    select manufacturer.country, from: 'Country'

    click_on 'Add Manufacturer'

    expect(page).to have_content 'Manufacturer successfully added'
    expect(Manufacturer.count).to eq(pre_count + 1)
  end

end
