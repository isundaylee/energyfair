class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.text :description
      t.boolean :logo_permission
      t.integer :level
      t.string :gigawatt_option
      t.string :street_address
      t.string :city
      t.string :zip_code
      t.string :telephone
      t.integer :attendances
      t.text :attendee_names
      t.text :attendee_emails
      t.text :attendee_telephones
      t.boolean :additional_needed
      t.text :additional
      t.text :items
      t.string :networking_event
      t.text :comment

      t.timestamps null: false
    end
  end
end
