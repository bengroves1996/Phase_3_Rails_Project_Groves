class   TasksController < ApplicationController
    def index
        @task = Task.all
        
    end 

    def new
        redirect_if_not_logged_in
        redirect_if_not_tasker
        @task = Project.new.tasks.new
    end

    def create

        redirect_if_not_logged_in
        redirect_if_not_tasker
        # Project.all[(params['id'].to_i - 1)].tasks.new(task_params) adds proper project_id to controller
        # current_user.projects.all[(params['id'].to_i - 1)].tasks.new(task_params)
        
        @task = current_user.projects.all[(params['id'].to_i - 1)].tasks.new(task_params)
        @task.user_id = current_user.id
        #@task = current_user.tasks.new(task_params) ## currently looks for only user:id needs to find project:id, call on current_user is incorrect
        #@task = Task.new(task_params)
        if @task.save
            flash[:notice] = "Task Created Successfully!"
            redirect_to '/projects'
        else
            flash[:notice] = "Task did not Save!"
            redirect_to '/projects/:id'
        end
    end

    private 

    def task_params
        params.require(:task).permit(:objective, :complete, :user_id, :project_id)
    end


end