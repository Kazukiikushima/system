class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  def staged(item)
    require 'date'
    stage_logs.create_by(item_id: item.id, active: "staging", date: Date.today)
  end
  
  def unstaged(item)
    haves.find_by(item_id: item.id).first.destroy
  end
end
