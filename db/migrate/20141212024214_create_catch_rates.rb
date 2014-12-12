class CreateCatchRates < ActiveRecord::Migration
  def change
    create_table :catch_rates do |t|

      t.timestamps
    end
  end
end
