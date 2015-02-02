require('rspec')

describe(Genre) do
  
  it { should have_and_belong_to_many(:books) }
  
end