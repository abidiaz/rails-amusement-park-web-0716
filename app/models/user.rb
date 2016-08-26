class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password
  # validates :password, presence: true
  
  def mood
  # binding.pry
    if nausea >= happiness
      "sad"
    else 
      "happy"
    end
  end

  def admin?
    if admin
      "ADMIN"
    end 
  end

end
