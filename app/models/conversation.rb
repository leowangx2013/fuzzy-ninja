class Conversation < ActiveRecord::Base
  belongs_to :user, inverse_of :conversations
  belongs_to :conversable, polymorphic: true

  has_many
end