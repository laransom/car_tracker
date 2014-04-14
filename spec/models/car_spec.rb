require 'spec_helper'

describe Car do

  it { should have_valid(:color).when('Blue', 'Periwinkle') }
  it { should_not have_valid(:color).when(nil, '') }

  it { should have_valid(:year).when('1998', '2012', '1980') }
  it { should_not have_valid(:year).when(nil, '', 'Red', '1979', '123567876543') }

  it { should have_valid(:mileage).when('1', '150000') }
  it { should_not have_valid(:color).when(nil, '', '-124') }

  it { should belong_to(:manufacturer) }

end
