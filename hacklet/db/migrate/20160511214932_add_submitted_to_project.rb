class AddSubmittedToProject < ActiveRecord::Migration
  def change
    add_column :projects, :submitted, :bool
  end
end
