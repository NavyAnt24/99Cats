class FixCatRentalRequestsTable < ActiveRecord::Migration
  def change
    rename_column :cat_rental_requests, :end_end, :end_date
  end
end
