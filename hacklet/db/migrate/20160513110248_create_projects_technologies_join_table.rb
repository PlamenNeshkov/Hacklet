class CreateProjectsTechnologiesJoinTable < ActiveRecord::Migration
  def self.up
    create_table :projects_technologies, :id => false do |t|
      t.integer :technology_id
      t.integer :project_id
    end

    add_index :projects_technologies, [:technology_id, :project_id]
  end

  def self.down
    drop_table :technologies_projects
  end
end
