class   TasksController < ApplicationController
    def index
       
    end 

    def new
        redirect_if_not_logged_in
        redirect_if_not_tasker
        @task = Task.new
    end

    def create
        redirect_if_not_logged_in
        redirect_if_not_tasker
        @task = Task.new(task_params)
        if @task.save
            redirect_to '/projects/:id'
        else
            render :new
        end
    end

    private 

    def task_params
        params.require(:task).permit(:objective, :complete)
    end


end