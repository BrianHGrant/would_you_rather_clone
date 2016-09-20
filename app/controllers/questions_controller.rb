class QuestionsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  helper ApplicationHelper
  helper_method :sort_column, :sort_direction

  def index

    @questions = Question.order(sort_column + " " + sort_direction)
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
      respond_to do |format|
        format.html { redirect_to question_path(@question) }
        format.js
      end
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

  def sort_column
    Question.column_names.include?(params[:sort]) ? params[:sort] : "a_votes"
  end

  def sort_direction
    %w[ASC DESC].include?(params[:direction]) ? params[:direction] : "ASC"
  end

  def question_params
    params.require(:question).permit(:a_answer, :b_answer, :a_votes, :b_votes)
  end

end
