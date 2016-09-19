class QuestionsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  helper ApplicationHelper

  def index
    @questions = Question.order(:created_at)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
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
    params.require(:question).permit(:a_answer, :b_answer, :a_votes, :b_votes)
  end

end
