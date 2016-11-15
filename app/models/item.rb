class Item < ApplicationRecord
  has_many :stage_logs, foreign_key: "item_id"
  
  scope :confirm, -> { where(stage: "ordering") }
end
