require "csv"

class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]
  before_action :set_company_options, only: %i[new create edit update]

  def index
    @projects = Project.order(updated_at: :desc)
  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "RH id: #{@project.id}", template: "projects/show.html.erb"   # Excluding ".pdf" extension.
      end
    end
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project, notice: "O Cadastro foi realizado com sucesso."
    else
      flash.now[:alert] = @project.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: "A atualização foi bem-sucessida."
    else
      flash.now[:alert] = @project.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_url, notice: "A remoção foi realizada com sucesso."
  end

  def export_csv
    headers = ["Nome", "Valor(R$)", "Empresa", "Criado em", "Atualizado em"]

    csv = CSV.generate(write_headers: true, headers: headers) do |row|
      Project.all.each do |project|
        row << [
          project.name,
          project.value,
          project.company.name,
          project.created_at,
          project.updated_at,
        ]
      end
    end

    send_data csv, type: "text/csv; charset=utf-8; header=present", disposition: "attachment; filename=companies.csv"
  end

  private

  def set_company_options
    @company_options = Company.all.pluck(:name, :id)
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :value, :company_id, :description)
  end
end
