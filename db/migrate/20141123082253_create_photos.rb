class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer  :city_id
      t.integer  :user_id
      t.float    :lat
      t.float    :lng
      t.string   :name
      t.boolean  :active, default: false
      t.timestamps
    end
  end
end
