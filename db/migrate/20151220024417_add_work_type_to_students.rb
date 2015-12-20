class AddWorkTypeToStudents < ActiveRecord::Migration
  def change
    add_column :students, :work_type, :text
  end
end
