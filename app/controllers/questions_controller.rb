class QuestionsController < ApplicationController
  def index
    @questions = Question.order(:created_at)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "Save successful"
      redirect_to question_path(@question)
    else
      flash[:alert] = "Failed to save"
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:notice] = "Save successful"
      redirect_to question_path(@question)
    else
      flash[:alert] = "Failed to save"
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
  end

  private

  def question_params
    params.require(:question).permit(:content, :answer_a, :answer_b, :a_votes, :b_votes)
