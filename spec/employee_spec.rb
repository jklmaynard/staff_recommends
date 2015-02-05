require('spec_buddy')

describe(Employee) do
  
  it{ should have_and_belong_to_many(:books) }
  it{ should have_many(:comments) }
end