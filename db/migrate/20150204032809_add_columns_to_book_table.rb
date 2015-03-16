class AddColumnsToBookTable < ActiveRecord::Migration
  def change
    add_column(:books, :publisher, :string)
    add_column(:books, :copyright, :integer)
  end
end
