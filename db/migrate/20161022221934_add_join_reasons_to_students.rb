class AddJoinReasonsToStudents < ActiveRecord::Migration
  def change
    add_column :students, :join_reasons, :text
  end
end
