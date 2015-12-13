class Conversation < ActiveRecord::Base
  belongs_to :conversable, polymorphic: true
  has_many :messages, inverse_of: :conversation
end