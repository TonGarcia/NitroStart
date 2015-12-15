class User < ActiveRecord::Base
  # Concerns Dependencies
  include Name
  include Legal
  include Profile
  include Security

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

end
