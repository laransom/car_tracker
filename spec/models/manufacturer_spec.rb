require 'spec_helper'

describe Manufacturer do

  it { should have_valid(:name).when('Ford', 'Alfa Romeo') }
  it { should_not have_valid(:name).when(nil, '',) }

  it { should have_valid(:country).when('Italy', 'Japan') }
  it { should_not have_valid(:country).when(nil, '') }

  it { should have_many(:cars).dependent(:nullify) }

end
