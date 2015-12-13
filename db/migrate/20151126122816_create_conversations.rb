class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.belongs_to :conversable, null: false, polymorphic: true

      t.timestamps null: false
    end
  end
end
