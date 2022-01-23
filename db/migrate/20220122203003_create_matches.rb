class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches do |t|
      t.string :title
      t.string :details

      t.timestamps
    end
  end
end
