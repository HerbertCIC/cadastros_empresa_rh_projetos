require "csv"

class CompaniesController < ApplicationController
  before_action :set_company, only: %i[ show edit update destroy ]

  def index
    @companies = Company.order(updated_at: :desc)
  end

  def show
    @projects = @company.projects.order(created_at: :desc)
    @human_resources = @company.human_resources.order(created_at: :desc)
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Company id: #{@company.id}", template: "companies/show.html.erb"   # Excluding ".pdf" extension.
      end
    end
  end

  def new
    @company = Company.new
  end

  def edit
  end

  def create
    @company = Company.new(company_params)

    if @company.save
      redirect_to @company, notice: "O cadastrado foi realizado com sucesso."
    else
      flash.now[:alert] = @company.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    if @company.update(company_params)
      redirect_to @company, notice: "A atualização foi bem-sucessida."
    else
      flash.now[:alert] = @company.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @company.destroy
    redirect_to companies_url, notice: "A remoção foi realizada com sucesso."
  end

  def export_csv
    headers = ["Nome", "CNPJ", "Email", "Criada em", "Atualizada em"]

    csv = CSV.generate(write_headers: true, headers: headers) do |row|
      Company.all.each do |company|
        row << [
          company.name,
          company.cnpj,
          company.email,
          company.contact_name,
          company.contact_email,
          company.created_at,
          company.updated_at,
        ]
      end
    end

    send_data csv, type: "text/csv; charset=utf-8; header=present", disposition: "attachment; filename=companies.csv"
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :cnpj, :email, :contact_name, :contact_email)
  end
end
