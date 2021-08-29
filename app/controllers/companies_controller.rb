class CompaniesController < ApplicationController
  before_action :set_company, only: %i[ show edit update destroy ]

  def index
    @companies = Company.all
  end

  def show
    @projects_for_company = Project.where("company_id = ?", params[:id])
    @human_resources_for_company = HumanResource.where("company_id = ?", params[:id])
  end

  def new
    @company = Company.new
  end

  def edit
  end

  def create
    @company = Company.new(company_params)

    if @company.save
      redirect_to @company, notice: "Cadastrado realizado com sucesso."
    else
      flash.now[:alert] = @company.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    if @company.update(company_params)
      redirect_to @company, notice: "Atualização foi bem-sucessida."
    else
      flash.now[:alert] = @company.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @company.destroy
    redirect_to companies_url, notice: "Remoção foi realizada com sucesso."
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:description, :cnpj, :email)
  end
end
