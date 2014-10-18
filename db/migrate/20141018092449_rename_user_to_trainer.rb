class RenameUserToTrainer < ActiveRecord::Migration
  def change
    rename_table :users, :trainers
  end
end
