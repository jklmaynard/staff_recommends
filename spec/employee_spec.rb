require('spec_buddy')

describe(Employee) do
  
  it{ should have_and_belong_to_many(:books) }
  
end