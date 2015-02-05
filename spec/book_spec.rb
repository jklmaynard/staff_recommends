require('spec_buddy')

describe(Book) do 
  
  it { should have_and_belong_to_many(:employees) }
  it { should have_and_belong_to_many(:genres) }
  it { should have_many(:comments) }
end