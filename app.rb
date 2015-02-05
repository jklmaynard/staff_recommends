require("bundler/setup")
Bundler.require(:default)

configure :development do
  set :bind, '0.0.0.0'
  set :port, 3000
end

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

# /INDEX routes

get("/") do 
  @employees = Employee.all()
  @books = Book.all()
  erb(:index)
end

post("/employee") do
  name = params.fetch("name")
  @employee = Employee.create({ :employee => name })
  @employees = Employee.all()
  @books = Book.all()
  erb(:index)
end

post("/add_books") do
  name = params.fetch("name")
  author = params.fetch("author")
  @book = Book.create({ :name => name, :author => author })
  @books = Book.all()
  @employees = Employee.all()
  erb(:index)
end

# /EMPLOYEE/:id routes

get("/employees/:id") do
  @employee = Employee.find(params["id"])
  erb(:employees)
end

delete("/employees/:id") do
  @employee = Employee.find(params["id"])
  @employee.destroy
  redirect("/")
end

# /BOOKS/:id routes

get("/books/:id") do
  @book = Book.find(params["id"])
  @employees = Employee.all()
  @genres = Genre.all()
  @comments = Comment.all()
  erb(:books)
end

delete("/books/:id") do
  @book = Book.find(params["id"])
  @book.destroy
  redirect("/")
end

# /BOOKS/edit/:id routes

get("/books/edit/:id") do
  @book = Book.find(params["id"])
  @employees = Employee.all()
  @genres = Genre.all()
  erb(:books_edit)
end

post("/books/add_genre/:id") do 
  @book = Book.find(params["id"])
  genre_ids = params.fetch("genre_ids")
  @book.update({ :genre_ids => genre_ids })
  @genres = Genre.all()
  @employees = Employee.all()
  erb(:books)
end

patch("/books/edit/:id") do
  @book = Book.find(params["id"])
  employee_ids = params.fetch("employee_ids")
  @book.update({ :publisher => params["publisher"], :copyright => params["copyright"], :employee_ids => employee_ids })
  @employees = Employee.all()
  erb(:books)
end

# /GENRES routes

get("/genres") do
  @genres = Genre.all()
  erb(:genres)
end

post("/genre") do
  genre = params.fetch("genre")
  @genre = Genre.create({ :genre => genre })
  @genres = Genre.all()
  erb(:genres)
end

# /GENRES/each routes

get("/genres/:id") do
  @genre = Genre.find(params["id"])
  erb(:genre_each)
end

delete("/genres/:id") do
  @genre = Genre.find(params["id"])
  @genre.destroy
  @genres = Genre.all()
  erb(:genres)
end

# /COMMENTS routes

get("/comments/:id") do
  @employee = Employee.find(params["id"])
  @books = Book.all()
  erb(:employee_comment)
end

post("/comments/:id") do
  book_id = params.fetch("book_id")
  employee_id = params.fetch("employee_id")
  comment = params.fetch("comment")
  @comment = Comment.create({ :comment => comment, :book_id => book_id, :employee_id => employee_id })
  @employee = Employee.find(params["id"])
  @books = Book.all()
  erb(:submission)
end


