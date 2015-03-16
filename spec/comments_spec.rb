require('spec_buddy')

describe(Comment) do
  
  it{ should belong_to(:book) }
  it{ should belong_to(:employee) }
  
end