class ProjectsController < ApplicationController
  before_action :require_login, except: :show
  before_action :set_project, except: [:new, :create]

  def show
    @images = @project.images
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to project_path(id: @project)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to project_path(@project)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @project.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def set_project
    begin
      @project = Project.friendly.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      redirect_to root_path
    end
  end

  def project_params
    params.require(:project).permit(:name, :body, :avatar, images: [])
  end
end
