class Issue < ApplicationRecord
  
  STATUS = ["Open", "Pending", "Closed"]
  PRIORITY = ["Low", "Normal", "High"]
  
  validates_presence_of :name, :body
  
end
