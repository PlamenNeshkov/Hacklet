class AddProfileAttributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :about_text, :string
    add_column :users, :site_url, :string
    add_column :users, :facebook_url, :string
    add_column :users, :twitter_url, :string
  end
end
