class ChangeDataFormatInCatchRates < ActiveRecord::Migration
  def change
  	change_column :catch_rates, :ball, :integer
  end
end
