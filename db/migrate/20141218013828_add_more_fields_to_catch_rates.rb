class AddMoreFieldsToCatchRates < ActiveRecord::Migration
  def change
    add_column :catch_rates, :repeat, :boolean
    add_column :catch_rates, :turn_number, :integer
    add_column :catch_rates, :enemy_level, :integer
    add_column :catch_rates, :bug_water_type, :boolean
    add_column :catch_rates, :dive_surf_fish, :boolean
    add_column :catch_rates, :cave_night, :boolean
  end
end
