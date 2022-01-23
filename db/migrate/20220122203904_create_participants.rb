class CreateParticipants < ActiveRecord::Migration[6.1]
  def change
    create_table :participants do |t|
      t.float :score
      t.references :member, foreign_key: true
      t.references :match, foreign_key: true

      t.timestamps
    end
  end
end
