class AddStatusToParticipants < ActiveRecord::Migration[6.1]
  def change
    add_column :participants, :status, :integer
  end
end
