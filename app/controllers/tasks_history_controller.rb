class TasksHistoryController < ApplicationController
  def index
    @task_history = Task.where.not(completed: nil)
  end
end
