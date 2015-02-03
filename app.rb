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

# /EMPLOYEE/:id routes

get("/employees/:id") do
  @employee = Employee.find(params["id"])
  erb(:employees)
end

post("/add_books") do
  name = params.fetch("name")
  employee_id = params.fetch("employee_id")
  @book = Book.create({ :name => name, :employee_ids => employee_id })
  @books = Book.all()
  @employee = Employee.find(employee_id)
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
  erb(:books)
end

delete("/books/:id") do
  @book = Book.find(params["id"])
  @book.destroy
  redirect("/")
end

