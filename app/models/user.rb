class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :missions, dependent: :destroy
  has_many :supervisions, class_name: Mission::Supervision.name, inverse_of: :supervisor

  has_many :friendships, dependent: :destroy, inverse_of: :user
  has_many :friends, through: :friendships, class_name: User.name
end
