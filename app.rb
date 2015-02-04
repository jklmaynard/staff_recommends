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
  erb(:books_edit)
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

