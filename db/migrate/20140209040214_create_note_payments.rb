class CreateNotePayments < ActiveRecord::Migration
  def change
    create_table :note_payments do |t|
      t.integer :note_id
      t.string :tx_hash
      t.integer :satoshis

      t.timestamps
    end

    add_index :note_payments, :tx_hash
  end
end
