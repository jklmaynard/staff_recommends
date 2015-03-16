class AddCommentsTable < ActiveRecord::Migration
  def change
    create_table(:comments) do |t|
      t.column(:comment, :string)
      t.column(:employee_id, :integer)
      t.column(:book_id, :integer)
    end
  end
end
