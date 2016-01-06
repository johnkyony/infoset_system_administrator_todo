class TasksHistoryController < ApplicationController
  def index
    @task_history = Task.where(completed: nil)
  end
end
