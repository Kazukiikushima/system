class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :stage_logs, foreign_key: "user_id"
  
  def staged(item)
    require 'date'
    stage_logs.create(item_id: item.id, active: "staging", date: Date.today)
  end
  
  def unstaged(item)
    require 'date'
    stage_logs.create(item_id: item.id, active: "unstaging", date: Date.today)
  end
  
  
end
