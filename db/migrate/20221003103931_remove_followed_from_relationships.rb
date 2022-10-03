class RemoveFollowedFromRelationships < ActiveRecord::Migration[6.1]
  def change
    remove_column :relationships, :followed_, :integer
  end
end
