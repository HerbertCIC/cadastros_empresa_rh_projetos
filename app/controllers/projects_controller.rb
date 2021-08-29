class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]
  before_action :set_company_options, only: %i[new create edit update]

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project, notice: "Cadastrado realizado com sucesso."
    else
      flash.now[:alert] = @project.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: "Atualização foi bem-sucessida."
    else
      flash.now[:alert] = @project.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_url, notice: "Remoção foi realizada com sucesso."
  end

  private

  def set_company_options
    @company_options = Company.all.pluck(:description, :id)
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:description, :value, :company_id)
  end
end
