class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :content
      t.string :from
      t.string :address

      t.timestamps
    end
  end
end
