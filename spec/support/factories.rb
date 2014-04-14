FactoryGirl.define do

  factory :car do
    color 'Black'
    year '1998'
    mileage '14000'
    description 'A classic with almost no logged miles!'
  end

  factory :manufacturer do
    name 'Ford'
    country 'United States of America'
  end

end
