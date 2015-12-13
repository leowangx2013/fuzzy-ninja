class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :conversation, null: false, foreign_key: true
      t.text :content, null: false

      t.timestamps null: false
    end
  end
end
