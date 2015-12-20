class AddResumePermissionToStudents < ActiveRecord::Migration
  def change
    add_column :students, :resume_permission, :boolean
  end
end
