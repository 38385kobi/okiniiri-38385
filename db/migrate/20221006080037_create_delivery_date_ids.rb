class CreateDeliveryDateIds < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_date_ids do |t|

      t.timestamps
    end
  end
end
