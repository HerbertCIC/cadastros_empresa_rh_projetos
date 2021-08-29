class HumanResourcesController < ApplicationController
  before_action :set_human_resource, only: %i[ show edit update destroy ]
  before_action :set_company_options, only: %i[new create edit update]

  def index
    @human_resources = HumanResource.all
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
      redirect_to @human_resource, notice: "Cadastrado realizado com sucesso."
    else
      flash.now[:alert] = @human_resource.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    if @human_resource.update(human_resource_params)
      redirect_to @human_resource, notice: "Atualização foi bem-sucessida."
    else
      flash.now[:alert] = @human_resource.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @human_resource.destroy
    redirect_to human_resources_url, notice: "Remoção foi realizada com sucesso."
  end

  private

  def set_company_options
    @company_options = Company.all.pluck(:description, :id)
  end

  def set_human_resource
    @human_resource = HumanResource.find(params[:id])
  end

  def human_resource_params
    params.require(:human_resource).permit(:description, :cpf, :email, :phone_number, :company_id)
  end
end
