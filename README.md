
SOME NOTES FOR MYSELF:

--> After an employee submits a book, s/he will have the option to edit and add a recommendation.  This will go on the books individual /books/:id .erb, and be put into a "Comments" join table.

--> Created join on employee.erb with /books/:id post route.  Use Book.create({ :name => name, :employee_ids => employe_id }) which will register on the books-employees join table.  Next steps:

  1. Allow editing (author name, publisher, publishing date) on books.erb. (DONE)
  
  2. Allow individual employees to leave comments about the books on their own page, and allow it to show on books.erb. 
  
  3. Create a list of employees that have recommended the page. (DONE!)
  
    3a --> This will have to be done through a books/edit.erb file.  Have a single page for books and the ability to edit employees onto that book. Meanwhile, on the employees/:id pages, just a list of the books w/out the ability to add, until I figure out how to utilize an .== method that registers in the join table. 
    
    