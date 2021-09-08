require 'csv'
class HumanResourcesController < ApplicationController
  before_action :set_human_resource, only: %i[ show edit update destroy ]
  before_action :set_company_options, only: %i[new create edit update]

  def index
    @human_resources = HumanResource.order(updated_at: :desc)
  end

  def show
  end

  def new
    @human_resource = HumanResource.new
  end

  def edit
  end

  def create
    @human_resource = HumanResource.new(human_resource_params)

    if @human_resource.save
      redirect_to @human_resource, notice: "O cadastrado foi realizado com sucesso."
    else
      flash.now[:alert] = @human_resource.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    if @human_resource.update(human_resource_params)
      redirect_to @human_resource, notice: "A atualização foi bem-sucessida."
    else
      flash.now[:alert] = @human_resource.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @human_resource.destroy
    redirect_to human_resources_url, notice: "A remoção foi realizada com sucesso."
  end

  def export_csv
    headers = ["Nome", "CPF", "Email", "Telefone", "Criada em", "Atualizada em"]

    csv = CSV.generate(write_headers: true, headers: headers) do |row|
      HumanResource.all.each do |human_resource|
        row << [
          human_resource.name,
          human_resource.cpf,
          human_resource.email,
          human_resource.phone_number,
          human_resource.created_at,
          human_resource.updated_at,
        ]
      end
    end

    send_data csv, type: "text/csv; charset=utf-8; header=present", disposition: "attachment; filename=companies.csv"
  end

  private

  def set_company_options
    @company_options = Company.all.pluck(:name, :id)
  end

  def set_human_resource
    @human_resource = HumanResource.find(params[:id])
  end

  def human_resource_params
    params.require(:human_resource).permit(:name, :cpf, :email, :phone_number, :company_id, :age, :schooling_level)
  end
end
