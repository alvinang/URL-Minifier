class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.references :url, index: true
      t.integer :count

      t.timestamps
    end
  end
end
