class RemoveNetworkingEventFromCompanies < ActiveRecord::Migration
  def change
      remove_column :companies, :networking_event
  end
end
