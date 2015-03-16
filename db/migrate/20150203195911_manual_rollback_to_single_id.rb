class ManualRollbackToSingleId < ActiveRecord::Migration
  def change
    
    drop_table(:books_employees)
    drop_table(:books_genres)
    
    create_table(:books_employees) do |t|
      t.column(:book_id, :integer)
      t.column(:employee_id, :integer)
    end
    
    create_table(:books_genres) do |t|
      t.column(:book_id, :integer)
      t.column(:genre_id, :integer)
    end
  end
end
