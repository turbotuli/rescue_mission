class AnswersController < ApplicationController
  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question
    if @answer.save
      redirect_to @question, notice: 'Your answer has been posted successfully.'
    else
      @question = Question.find_by(id: params[:question_id])
      @answers = Question.find_by(id: params[:question_id]).answers.order('created_at desc')
      render :'questions/show'
    end
  end

  private
    def answer_params
      params.require(:answer).permit(:question_id, :user_id, :description)
    end

end
