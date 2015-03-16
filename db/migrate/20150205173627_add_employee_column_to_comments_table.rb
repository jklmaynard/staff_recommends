class AddEmployeeColumnToCommentsTable < ActiveRecord::Migration
  def change
    add_column(:comments, :employee, :string)
  end
end
