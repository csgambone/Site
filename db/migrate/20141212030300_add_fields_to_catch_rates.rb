class AddFieldsToCatchRates < ActiveRecord::Migration
  def change
    add_column :catch_rates, :catchrate, :integer
    add_column :catch_rates, :currenthp, :integer
    add_column :catch_rates, :maxhp, :integer
    add_column :catch_rates, :status, :double
    add_column :catch_rates, :ball, :double
    add_column :catch_rates, :opower, :double
    add_column :catch_rates, :caught, :integer
  end
end
