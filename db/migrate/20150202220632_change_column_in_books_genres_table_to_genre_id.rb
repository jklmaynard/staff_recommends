class ChangeColumnInBooksGenresTableToGenreId < ActiveRecord::Migration
  def change
    remove_column(:books_genres, :employee_id, :integer)
    add_column(:books_genres, :genre_id, :integer)
    
  end
end
