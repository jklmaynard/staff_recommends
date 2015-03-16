class Comment < ActiveRecord::Base
  
  belongs_to(:book)
  belongs_to(:employee)
  
end