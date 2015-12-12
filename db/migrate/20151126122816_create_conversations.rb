class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :conversable, null: false, polymorphic: true

      t.timestamps null: false
    end
  end
end
