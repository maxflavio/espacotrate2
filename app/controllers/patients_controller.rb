class PatientsController < ApplicationController

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    @patient.save
    redirect_to patients_path
  end

  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])

    if @patient.update(patient_params)
      redirect_to patients_path
    else
      render 'edit'
    end
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  private
  def patient_params
    params.require(:patient).permit(:nome, :cpf, :data_nascimento, :telefone, :photo)
  end

end
