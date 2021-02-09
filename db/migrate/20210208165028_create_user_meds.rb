class CreateUserMeds < ActiveRecord::Migration[6.0]
  def change
    create_table :user_meds do |t|
      t.string :dosage
      t.string :time
      t.string :notes
      t.integer :pill_count
      t.boolean :has_taken, :default => false
      t.integer :user_id
      t.integer :med_id

      t.timestamps
    end
  end
end
