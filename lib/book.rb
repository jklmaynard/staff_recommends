class Book < ActiveRecord::Base
 
  has_and_belongs_to_many(:employees)
  has_and_belongs_to_many(:genres)
  has_many(:comments)
  before_save(:titleize)
  
  private
  
  define_method(:titleize) do
    new_titles = []
    names = self.name.downcase.split(" ")
    names.each do |word|
      new_titles.push(word.capitalize!)
    end
    self.name = (new_titles.join(" "))
  end
  
end