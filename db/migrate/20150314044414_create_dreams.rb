class CreateDreams < ActiveRecord::Migration
  def change
    create_table :dreams do |t|
      t.string :content
      t.datetime :timeline
      t.boolean :completed

      t.timestamps
    end
  end
end
