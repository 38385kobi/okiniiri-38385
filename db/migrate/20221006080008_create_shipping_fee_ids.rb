class CreateShippingFeeIds < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_fee_ids do |t|

      t.timestamps
    end
  end
end
