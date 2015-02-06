require('spec_buddy')

describe(Book) do 
  
  it { should have_and_belong_to_many(:employees) }
  it { should have_and_belong_to_many(:genres) }
  it { should have_many(:comments) }
  
  it("capitalizes each word of the title of the book") do
    book = Book.create({ :name => "the book" })  
    expect(book.name()).to eq ("The Book")
  end
  
end