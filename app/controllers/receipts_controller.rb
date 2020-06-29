class ReceiptsController < ApplicationController

  def new
    @receipt = Receipt.new
    @patients = Patient.all.map { |patient| [patient.nome, patient.id]}
  end

  def create
    @receipt = Receipt.new(receipt_params)
    # @receipt.patient = Patient.find_by_cpf(params[:patient][:cpf])
    @receipt.save
    redirect_to receipts_path
  end

  def index
    @receipts = Receipt.all
  end

  def show
    @receipt = Receipt.find(params[:id])

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Invoice No. #{@receipt.id}",
               page_size: 'A4',
               template: "receipts/show.html.erb",
               layout: "pdf.html",
               orientation: "Landscape",
               lowquality: true,
               zoom: 1,
               dpi: 75
      end
    end

  end

  def update
    @receipt = Receipt.find(params[:id])

    if @receipt.update(receipt_params)
      redirect_to receipts_path
    else
      render 'edit'
    end
  end

  def edit
    @receipt = Receipt.find(params[:id])
    @patients = Patient.all.map { |patient| [patient.nome, patient.id]}
  end

  private
  def receipt_params
    params.require(:receipt).permit(:valor, :descricao_tratamento, :patient_id)
  end

end
