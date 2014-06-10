class CreateClickers < ActiveRecord::Migration
  def change
    create_table :clickers do |t|
      t.string :name
      t.string :ip
      t.timestamps
    end
  end
end
