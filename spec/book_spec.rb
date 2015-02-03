require('spec_buddy')

describe(Book) do 
  
  it { should have_and_belong_to_many(:employees) }
  it { should have_and_belong_to_many(:genres) }
    
end