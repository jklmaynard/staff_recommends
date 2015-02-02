class AddTablesToDatabase < ActiveRecord::Migration
  def change
    create_table(:books) do |t|
      t.column(:name, :string)
    end
    
    create_table(:books_employees) do |t|
      t.column(:book_id, :integer)
      t.column(:employee_id, :integer)
    end
    
    create_table(:books_genres) do |t|
      t.column(:book_id, :integer)
      t.column(:employee_id, :integer)
    end
    
    create_table(:employees) do |t|
      t.column(:employee, :string)
    end
    
    create_table(:genres) do |t|
      t.column(:genre, :string)
    end
    
  end
end
