class CreateNoteProofs < ActiveRecord::Migration
  def change
    create_table :note_proofs do |t|
      t.integer :note_id
      t.string :tx_hash
      t.integer :satoshis

      t.timestamps
    end

    add_index :note_proofs, :tx_hash
  end
end
