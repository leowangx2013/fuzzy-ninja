class Message < ActiveRecord::Base
  belongs_to :conversation, inverse_of :messages
  belongs_to :user, inverse_of :messages
end