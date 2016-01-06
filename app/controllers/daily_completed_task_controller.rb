class DailyCompletedTaskController < ApplicationController
  def index
    complete = Task.where.not(completed: nil).pluck(:id)
    @completed = Task.where(id: complete)
        
  end
end
