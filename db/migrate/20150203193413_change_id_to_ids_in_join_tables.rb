class ChangeIdToIdsInJoinTables < ActiveRecord::Migration
  def change
    
    drop_table(:books_employees)
    drop_table(:books_genres)
    
    create_table(:books_employees) do |t|
      t.column(:book_ids, :integer)
      t.column(:employee_ids, :integer)
    end
    
    create_table(:books_genres) do |t|
      t.column(:book_ids, :integer)
      t.column(:genre_ids, :integer)
    end
    
  end
end
