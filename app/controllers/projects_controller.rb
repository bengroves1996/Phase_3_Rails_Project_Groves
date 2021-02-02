class ProjectsController < ApplicationController

    def index
        redirect_to '/projects/index'
    end 

    def new
        redirect_if_not_logged_in
        redirect_if_not_tasker
        @project = Project.new
    end

    def create
        @project = Project.new(project_params)
        if @project.save
            redirect_to '/projects/home'
        else
            render :new
        end
    end

    def show
        @project = Project.all
        @projects = Project.find_by(id: params[:id])
    end 
    private 

    def project_params
        params.require(:project).permit(:priority, :description, :title)
    end

end