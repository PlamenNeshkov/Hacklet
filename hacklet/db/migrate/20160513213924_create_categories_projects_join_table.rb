class CreateCategoriesProjectsJoinTable < ActiveRecord::Migration
  def self.up
    create_table :categories_projects, :id => false do |t|
      t.integer :category_id
      t.integer :project_id
    end

    add_index :categories_projects, [:category_id, :project_id]
  end

  def self.down
    drop_table :categories_projects
  end
end
