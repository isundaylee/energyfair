class AddCommentsToStudents < ActiveRecord::Migration
  def change
    add_column :students, :comments, :text
  end
end
