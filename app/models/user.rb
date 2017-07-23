class User < ActiveRecord::Base
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :wikis
  after_initialize {self.role ||= :standard}

  validates :username, length: { minimum: 1, maximum: 100 }, presence: true
   
  enum role: [:standard, :premium, :admin]
  
end
