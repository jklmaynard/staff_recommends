require("bundler/setup")
Bundler.require(:default)

configure :development do
  set :bind, '0.0.0.0'
  set :port, 3000
end

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get("/") do 
  "Hello world!"
  @employees = Employee.all()
  erb(:index)
end

post("/employee") do
  name = params.fetch("name")
  @employee = Employee.create({ :employee => name })
  @employees = Employee.all()
  erb(:index)
end

get("/index") do
  "Hello World!"
end