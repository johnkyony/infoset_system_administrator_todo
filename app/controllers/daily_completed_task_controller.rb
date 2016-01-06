class DailyCompletedTaskController < ApplicationController
  def index
    complete = Task.where.not(completed: nil).pluck(:id)
    @completed = Task.where(id: complete).order(completed: :desc)
        
  end
end
