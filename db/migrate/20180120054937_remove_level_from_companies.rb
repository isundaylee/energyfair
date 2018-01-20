class RemoveLevelFromCompanies < ActiveRecord::Migration
  def change
    remove_column :companies, :level
  end
end
