class AddActiveToCity < ActiveRecord::Migration
  def change
    add_column :cities, :is_collect, :boolean, default: false
  end
end
