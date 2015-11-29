class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :university
      t.string :degree
      t.string :major
      t.text :interests
      t.integer :graduation_month
      t.integer :graduation_year
      t.string :citizenship
      t.text :top_companies

      t.timestamps null: false
    end
  end
end
