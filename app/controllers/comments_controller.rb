class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    @comment.data_comentario = Date.new
    @patient = Patient.find_by_cpf(params[:nr_cpf])
    @comment.patient = @patient
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.data_comentario = Time.new
    @comment.patient = Patient.find_by_cpf(params[:patient][:cpf])
    @comment.save
    redirect_to controller: 'comments', action: 'index', nr_cpf: params[:patient][:cpf]
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to @comment
    else
      render 'edit'
    end
  end

  def index
    @patient = Patient.find_by_cpf(params['nr_cpf'])
    @comments = Array.new
    @comments = Comment.where(patient_id: @patient.id)
  end

  private
  def comment_params
    params.require(:comment).permit( :conteudo, patient_attributes: [:cpf, :nome])
  end

end
