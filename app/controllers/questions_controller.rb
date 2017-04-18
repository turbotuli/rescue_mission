class QuestionsController < ApplicationController
  def index
    @questions = Question.all.order('created_at desc')
  end

  def show
    @question = Question.find_by(id: params[:id])
    # why doesn't @question.answers work?
    @answers = Question.find_by(id: params[:id]).answers.order('created_at desc')
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to @question, notice: 'Your question has been posted successfully.'
    else
      render :new
    end
  end

  private
    def question_params
      params.require(:question).permit(:user_id, :title, :description)
    end

end
