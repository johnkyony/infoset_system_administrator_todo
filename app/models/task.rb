class Task < ActiveRecord::Base
    validates_presence_of :title
    # validates_presence_of :future_completed_date
    validates_presence_of :user
    belongs_to :user
    private
    
    def future_completed_date
        if !completed.blank? && completed > Date.today
            self.errors.add(:completed , "can't be in the future")
        end
    end
end
