class CreateNoteTransactions < ActiveRecord::Migration
  def change
    create_table :note_transactions do |t|
      t.integer :note_id
      t.string :tx_hash
      t.integer :satoshis
      t.string :tx_type

      t.timestamps
    end

    add_index :note_transactions, :tx_hash
  end
end
