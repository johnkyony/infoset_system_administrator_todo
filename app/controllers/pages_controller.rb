class PagesController < ApplicationController
  def home
   @tasks = Task.where(created_at: Date.today , completed: nil)
  end
end
