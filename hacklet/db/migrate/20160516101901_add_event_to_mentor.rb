class AddEventToMentor < ActiveRecord::Migration
  def change
    add_reference :mentors, :event, index: true, foreign_key: true
  end
end
